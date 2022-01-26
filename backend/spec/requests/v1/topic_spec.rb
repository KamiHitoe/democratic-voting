require 'rails_helper'

RSpec.describe Topic, type: :request do
  describe 'Topic request' do
    before(:each) do
      topic = create(:topic)
    end

    it 'get all topics' do
      get '/v1/topics'
      JSON.parse(response.body)
      expect(response.status).to eq(200)
      puts response.body
    end
  end
end
