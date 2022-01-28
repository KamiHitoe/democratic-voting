require 'rails_helper'

RSpec.describe(Comment, type: :request) do
  describe 'test Comment request' do
    before(:each) do
      @topic = create(:topic)
      @comment = create(:comment, topic_id: @topic.id)
    end

    it 'get all comments' do
      get "/v1/topics/#{@topic.id}/comments"
      JSON.parse(response.body)
      expect(response.status).to(eq(200))
      # puts response.body
    end

    it 'get a comment by id' do
      get "/v1/topics/#{@topic.id}/comments/#{@comment.id}"
      json = JSON.parse(response.body)
      expect(response.status).to(eq(200))
    end

    it 'create a new comment' do
      expect do
        post("/v1/topics/#{@topic.id}/comments", params: {
               user_id: 5,
               text: 'new text'
             })
      end.to(change(Comment, :count).by(1))
    end

    it 'update topic' do
      put "/v1/topics/#{@topic.id}/comments/#{@comment.id}", params: { like_num: 1 }
      # response.body is not exist
      expect(response).to(be_successful)
    end
  end
end
