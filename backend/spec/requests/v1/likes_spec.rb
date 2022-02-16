require 'rails_helper'

RSpec.describe(Like, type: :request) do
  describe 'test Like request' do
    before(:each) do
      @user = create(:user)
      @topic = create(:topic)
      @comment = create(:comment, topic_id: @topic[:id])
      @params = { user_id: @user[:id], comment_id: @comment[:id] }
      Like.create(@params)
    end

    it 'get the number of likes' do
      # comment[:id]に対するLikeの数をカウントできることを確認
      get "/v1/likes/count", params: {
        comment_id: @comment[:id],
      }
      json = JSON.parse(response.body)
      expect(response.status).to eq(200)
      expect(json["liked_num"]).to be_kind_of(Integer)
      expect(json["liked_num"]).not_to be_zero
    end

    it 'get a liked status by user' do
      # user[:id]とcomment[:id]に対するliked_statusをBooleanで返すことを確認
      get "/v1/likes", params: @params
      json = JSON.parse(response.body)
      expect(response.status).to eq(200)
      expect(json["liked_status"]).to be_kind_of(TrueClass) | be_kind_of(FalseClass)
    end

    it 'create a new like' do
      # Likeが作成できることを確認

      # すでに作成済のLikeが存在するのでLikeは増えないことを確認
      expect do
        post "/v1/likes", params: @params
      end.to change(Like, :count).by(0)
      expect(response).to be_successful

      # すでに作成済のLikeを削除
      like = Like.find_by(@params)
      like.destroy

      expect do
        post "/v1/likes", params: @params
      end.to change(Like, :count).by(1)
      expect(response).to be_successful
    end

    it 'destroy the like' do
      # Likeが削除できることを確認

      # すでに作成済のLikeを削除できることを確認
      expect do
        delete "/v1/likes", params: @params
      end.to change(Like, :count).by(-1)
      expect(response).to be_successful

      # Likeが存在しないので削除できないことを確認
      expect do
        delete "/v1/likes", params: @params
      end.to change(Like, :count).by(0)
      expect(response).to be_successful
    end

  end
end
