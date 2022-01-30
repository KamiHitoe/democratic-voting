require 'rails_helper'

RSpec.describe(Vote, type: :request) do
  describe 'test Vote request' do
    before(:each) do
      @user = create(:user)
      @topic = create(:topic)
    end

    it 'get a voted status by user' do
      get "/v1/votes/#{@user.id}/#{@topic.id}"
      json = JSON.parse(response.body)
      expect(response.status).to(eq(200))
      puts json
    end

    it 'create a new vote' do
      expect do
        post("/v1/votes/#{@user.id}/#{@topic.id}")
      end.to(change(Vote, :count).by(1))
    end

    it 'destroy a vote' do
      # create vote record to be deleted
      Vote.create!(user_id: @user.id, topic_id: @topic.id)

      expect do
        delete("/v1/votes/#{@user.id}/#{@topic.id}")
      end.to(change(Vote, :count).by(-1))

      # response.body is not exist
      expect(response).to(be_successful)
    end

  end
end
