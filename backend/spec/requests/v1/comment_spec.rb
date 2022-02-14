require 'rails_helper'

RSpec.describe(Comment, type: :request) do
  describe 'test Comment request' do
    before(:each) do
      @user = create(:user)
      @topic = create(:topic)
      @comments = create_list(:comment, 33, topic_id: @topic[:id])
    end

    it 'get all comments' do
      # TopicにたいしてCommentsのArrayが取得できることを確認
      get "/v1/topics/#{@topic[:id]}/comments"
      json = JSON.parse(response.body)
      expect(response.status).to(eq(200))
      expect(json).not_to be_empty
    end

    it 'get a comment by id' do
      get "/v1/topics/#{@topic[:id]}/comments/#{@comments[0][:id]}"
      json = JSON.parse(response.body)
      expect(response.status).to(eq(200))
      expect(json).to be_kind_of(Hash)
    end

    it 'create a new comment' do
      male_user = create(:user, sex: "男性")
      old_user = create(:user, age: 40)
      # valid user
      expect do
        post("/v1/topics/#{@topic[:id]}/comments", params: {
               user_id: @user[:id],
               text: 'new text'
             })
      end.to(change(Comment, :count).by(1))
      # invalid sex
      expect do
        post("/v1/topics/#{@topic[:id]}/comments", params: {
               user_id: male_user[:id],
               text: 'new text'
             })
      end.to(change(Comment, :count).by(0))
      # invalid age
      expect do
        post("/v1/topics/#{@topic[:id]}/comments", params: {
               user_id: old_user[:id],
               text: 'new text'
             })
      end.to(change(Comment, :count).by(0))
    end

    # it 'update comment' do
    #   put "/v1/topics/#{@topic[:id]}/comments/#{@comment[:id]}", params: { like_num: 1 }
    #   # response.body is not exist
    #   expect(response).to(be_successful)
    # end

    it 'get replied comments by parent comment id' do
      reply_comment = Comment.create(parent_id: @comments[0][:id], text: "test reply comment")
      get "/v1/comments/#{@topic[:id]}/#{@comments[0][:id]}"
      expect(response.status).to(eq(200))
    end


  end
end
