require 'rails_helper'

RSpec.describe(Like, type: :request) do
  describe 'test Like request' do
    before(:each) do
      @user = create(:user)
      @topic = create(:topic)
      @comment = create(:comment, topic_id: @topic[:id])
      @params = { user_id: @user[:id], comment_id: @comment[:id] }
    end

    it 'get the number of likes' do
      get "/v1/count-likes", params: {
        comment_id: @comment[:id],
      }
      json = JSON.parse(response.body)
      expect(response.status).to(eq(200))
      expect(json["liked_num"]).to be_kind_of(Integer)
    end

    it 'get a liked status by user' do
      # user_idとcomment_idを入力するとliked_statusをBooleanで返す
      get "/v1/likes", params: @params
      json = JSON.parse(response.body)
      expect(response.status).to(eq(200))
      expect(json["liked_status"]).to be_kind_of(TrueClass) | be_kind_of(FalseClass)
    end

    it 'create a new like' do
      expect do
        post "/v1/likes", params: @params
      end.to(change(Like, :count).by(1))
    end

    it 'destroy the like' do
      # create like record to be deleted
      Like.create(@params)

      expect do
        delete "/v1/likes", params: @params
      end.to(change(Like, :count).by(-1))

      # response.body is not exist
      expect(response).to(be_successful)
    end

  end
end
