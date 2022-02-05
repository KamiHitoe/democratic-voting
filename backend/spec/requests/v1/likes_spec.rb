require 'rails_helper'

RSpec.describe(Like, type: :request) do
  describe 'test Like request' do
    before(:each) do
      @user = create(:user)
      @topic = create(:topic)
      @comment = create(:comment, topic_id: @topic.id)
    end

    it 'get the number of likes' do
      get "/v1/likes/#{@comment.id}"
      json = JSON.parse(response.body)
      expect(response.status).to(eq(200))
      puts json
    end

    it 'get a liked status by user' do
      get "/v1/likes/#{@user.id}/#{@comment.id}"
      json = JSON.parse(response.body)
      expect(response.status).to(eq(200))
      puts json
    end

    it 'create a new like' do
      expect do
        post("/v1/likes/#{@user.id}/#{@comment.id}")
      end.to(change(Like, :count).by(1))
    end

    it 'destroy a like' do
      # create like record to be deleted
      Like.create(user_id: @user.id, comment_id: @comment.id)

      expect do
        delete("/v1/likes/#{@user.id}/#{@comment.id}")
      end.to(change(Like, :count).by(-1))

      # response.body is not exist
      expect(response).to(be_successful)
    end

  end
end
