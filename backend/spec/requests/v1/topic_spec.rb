require 'rails_helper'

RSpec.describe(Topic, type: :request) do
  describe 'test Topic request' do
    before(:each) do
      @user = create(:user)
      @topics = create_list(:topic, 33)
    end

    it 'get all topics by newest' do
      # top pageで新着順にソートしたものを30件ずつ返すことを確認
      get '/v1/topics?q'
      json = JSON.parse(response.body)
      expect(response.status).to(eq(200))
      expect(json.length).to(eq(30))
      # ソート結果が新着順になっていることを確認
      expect(json[0]['created_at']).to(be > json[1]['created_at'])
    end

    it 'get all topics by trend' do
      # top pageでトレンド順にソートしたものを30件ずつ返すことを確認
      get '/v1/topics?q=trend'
      json = JSON.parse(response.body)
      expect(response.status).to(eq(200))
      expect(json.length).to(eq(30))
      # ソート結果がトレンド順になっていることを確認
      expect(json[0]['created_at']).to(be > 3.days.ago)
    end

    it 'get all topics by ranking' do
      # top pageでランキング順にソートしたものを30件ずつ返すことを確認
      get '/v1/topics?q=ranking'
      json = JSON.parse(response.body)
      expect(response.status).to(eq(200))
      expect(json.length).to(eq(30))
      # ソート結果がランキング順になっていることを確認
      expect(json[0]['voted_num']).to(be >= json[1]['voted_num'])
    end

    it 'get a topic by id' do
      # topic[:id]によって該当Topicを取得できることを確認
      get "/v1/topics/#{@topics[0][:id]}"
      json = JSON.parse(response.body)
      expect(response.status).to(eq(200))
      # 一つのHashが返ることを確認
      expect(json).to(be_kind_of(Hash))
    end

    it 'search topics by category id' do
      # :category_idで検索した結果が、検索したcategory_idと一致することを確認
      get "/v1/search?category_id=#{@topics[0][:category_id]}"
      json = JSON.parse(response.body)
      expect(response.status).to(eq(200))
      expect(json[0]['category_id']).to(eq(@topics[0][:category_id]))
    end

    it 'search topics by period' do
      # periodで検索した結果が、検索したperiod内に収まることを確認
      get '/v1/search?period=weekly'
      json = JSON.parse(response.body)
      expect(response.status).to(eq(200))
      expect(json[0]['created_at']).to(be > 1.weeks.ago)
    end

    it 'search topics by sex' do
      # sexで検索した結果が、検索したsexと一致することを確認
      sex = 'female'
      get "/v1/search?sex=#{sex}"
      json = JSON.parse(response.body)
      expect(response.status).to(eq(200))
      expect(json[0]['sex']).to(eq(sex))
    end

    it 'search topics by age' do
      # ageで検索した結果が、検索したageと一致することを確認
      age = 20
      get "/v1/search?age=#{age}"
      json = JSON.parse(response.body)
      expect(response.status).to(eq(200))
      expect(json[0]['age']).to(eq(age))
    end

    it 'search topics by sort' do
      # sortで検索した結果が、新着順になることを確認
      get '/v1/search?sort'
      json = JSON.parse(response.body)
      expect(response.status).to(eq(200))
      expect(json[0]['created_at']).to(be > json[1]['created_at'])
    end

    it 'create a new topic' do
      # Topicが作成できることを確認
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
      expect(response).to(be_successful)
    end

    # it 'update option_num in the topic' do
    #   # :chosen_optionを与えるとtopicsが更新されることを確認
    #   put "/v1/topics/#{@topics[0].id}", params: { chosen_option: "1" }
    #   expect(response).to(be_successful)
    # end
  end
end
