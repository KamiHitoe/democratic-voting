require 'rails_helper'

RSpec.describe(Topic, type: :request) do
  describe 'test Topic request' do
    before(:each) do
      @topic = create(:topic)
    end

    it 'get all topics' do
      get '/v1/topics'
      json = JSON.parse(response.body)
      expect(response.status).to(eq(200))
      # puts response.body
    end

    it 'get a topic by id' do
      get "/v1/topics/#{@topic.id}"
      json = JSON.parse(response.body)
      expect(response.status).to(eq(200))
    end

    it 'create a new topic' do
      expect do
        post('/v1/topics', params: {
               user_id: 5,
               category_id: 5,
               title: 'new title',
               description: 'new description',
               option_1: 'new op1',
               option_2: 'new op2'
             })
      end.to(change(Topic, :count).by(1))
    end

    it 'update topic' do
      put "/v1/topics/#{@topic.id}", params: { chosen_option: :option_1_num }
      # response.body is not exist
      expect(response).to(be_successful)
    end
  end
end
