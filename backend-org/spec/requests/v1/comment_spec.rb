require 'rails_helper'

RSpec.describe(Comment, type: :request) do
  describe 'test Comment request' do
    before(:each) do
      @user = create(:user)
      @topic = create(:topic)
      @comments = create_list(:comment, 33, topic_id: @topic[:id])
    end

    it 'get all comments' do
      # Topicに対してCommentsのArrayが取得できることを確認
      get "/v1/topics/#{@topic[:id]}/comments"
      json = JSON.parse(response.body)
      expect(response.status).to eq(200)
      expect(json).to be_kind_of(Array)
      expect(json).not_to be_empty
    end

    it 'get a comment by id' do
      # 任意のCommentが取得できることを確認
      get "/v1/topics/#{@topic[:id]}/comments/#{@comments[0][:id]}"
      json = JSON.parse(response.body)
      expect(response.status).to eq(200)
      # 一つのHashが返ることを確認
      expect(json).to be_kind_of(Hash)
    end

    it 'create a new comment' do
      # 入力するUserごとにCommentが成功するか否か確認
      male_user = create(:user, sex: "男性")
      old_user = create(:user, age: 40)
      # Topicのsex, ageと合致するUserの場合、成功
      expect do
        post "/v1/topics/#{@topic[:id]}/comments", params: {
               user_id: @user[:id],
               text: 'new text'
             }
      end.to change(Comment, :count).by(1)
      # TopicとUserのsexが異なる場合、失敗
      expect do
        post "/v1/topics/#{@topic[:id]}/comments", params: {
               user_id: male_user[:id],
               text: 'new text'
             }
      end.to change(Comment, :count).by(0)
      # TopicとUserのageが異なる場合、失敗
      expect do
        post "/v1/topics/#{@topic[:id]}/comments", params: {
               user_id: old_user[:id],
               text: 'new text'
             }
      end.to change(Comment, :count).by(0)
    end

    # it 'update the comment' do
    #   put "/v1/topics/#{@topic[:id]}/comments/#{@comment[:id]}", params: { like_num: 1 }
    #   # response.body is not exist
    #   expect(response).to(be_successful)
    # end

    it 'destroy the comment' do
      # comment[:id]によって対象のCommentが削除できることを確認
      expect do
        delete "/v1/topics/#{@topic[:id]}/comments/#{@comments[0][:id]}"
      end.to change(Comment, :count).by(-1)
      expect(response).to(be_successful)
    end


    it 'get reply comments by parent comment id' do
      # 親のcomment[:id]によって、返信CommentがArrayで返ってくることを確認
      reply_comment1 = Comment.create(user_id: @user[:id], topic_id: @topic[:id], parent_id: @comments[0][:id], text: 'test')
      reply_comment2 = Comment.create(user_id: @user[:id], topic_id: @topic[:id], parent_id: @comments[0][:id], text: 'test')
      get "/v1/comments/#{@topic[:id]}/#{@comments[0][:id]}"
      json = JSON.parse(response.body)
      expect(response.status).to(eq(200))
      expect(json).to be_kind_of(Array)
      expect(json).not_to be_empty
    end


  end
end
