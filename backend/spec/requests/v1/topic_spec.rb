require 'rails_helper'

RSpec.describe(Topic, type: :request) do
  describe 'test Topic request' do
    before(:each) do
      @user = create(:user)
      @topics = create_list(:topic, 33)
    end

    it 'get all topics by newest' do
      # top pageで新着順にソートしたものを30件ずつ返す
      get '/v1/topics?q'
      json = JSON.parse(response.body)
      expect(response.status).to(eq(200))
      expect(json.length).to(eq(30))
    end

    it 'get all topics by trend' do
      # top pageでトレンド順にソートしたものを30件ずつ返す
      get '/v1/topics?q=trend'
      json = JSON.parse(response.body)
      expect(response.status).to(eq(200))
      expect(json.length).to(eq(30))
    end

    it 'get all topics by ranking' do
      # top pageでトレンド順にソートしたものを30件ずつ返す
      get '/v1/topics?q=ranking'
      json = JSON.parse(response.body)
      expect(response.status).to(eq(200))
      expect(json.length).to(eq(30))
    end

    it 'get a topic by id' do
      # topic[:id]によって該当topicを取得
      get "/v1/topics/#{@topics[0][:id]}"
      json = JSON.parse(response.body)
      expect(response.status).to(eq(200))
    end

    it 'search topics by category id' do
      # category_idで検索した結果が、検索したcategory_idと一致する
      get "/v1/search?category_id=#{@topics[0][:category_id]}"
      json = JSON.parse(response.body)
      expect(response.status).to(eq(200))
      expect(json[0]["category_id"]).to(eq(@topics[0][:category_id]))
    end

    it 'search topics by period' do
      # periodで検索した結果が、検索したperiod内に収まる
      get "/v1/search?period=weekly"
      json = JSON.parse(response.body)
      expect(response.status).to(eq(200))
      expect(json[0]["created_at"]).to be > 1.weeks.ago
    end

    it 'search topics by sex' do
      # sexで検索した結果が、検索したsexと一致する
      get "/v1/search?sex=female"
      json = JSON.parse(response.body)
      expect(response.status).to(eq(200))
      expect(json[0]["sex"]).to(eq("female"))
    end

    it 'search topics by age' do
      # ageで検索した結果が、検索したageと一致する
      get "/v1/search?age=20"
      json = JSON.parse(response.body)
      expect(response.status).to(eq(200))
      expect(json[0]["age"]).to(eq(20))
    end

    it 'search topics by sort' do
      # sortで検索した結果が、新着順になる
      get "/v1/search?sort"
      json = JSON.parse(response.body)
      expect(response.status).to(eq(200))
      expect(json[0]["created_at"]).to be > json[30]["created_at"]
    end



    it 'create a new topic' do
      expect do
        post('/v1/topics', params: {
               user_id: @user.id,
               category_id: 5,
               title: 'new title',
               description: 'new description',
               option_1: 'new op1',
               option_2: 'new op2'
             })
      end.to(change(Topic, :count).by(1))
    end

    it 'update option_num in the topic' do
      # :chosen_optionを与えるとtopicsが更新されることを確認
      put "/v1/topics/#{@topics[0].id}", params: { chosen_option: "1" }
      # response.body is not exist
      expect(response).to(be_successful)
    end
  end
end
