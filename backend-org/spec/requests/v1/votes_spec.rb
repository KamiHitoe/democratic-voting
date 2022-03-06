require 'rails_helper'

RSpec.describe(Vote, type: :request) do
  describe 'test Vote request' do
    before(:each) do
      @user = create(:user)
      @topic = create(:topic)
      @votes = create_list(:vote, 33)
      @params = {
        user_id: @user[:id],
        topic_id: @topic[:id],
        chosen_option: @votes[0][:chosen_option],
      }
      Vote.create(@params)
    end

    it 'get the number of votes grouped by chosen_option' do
      # 性別・年代でソートされた選択肢ごとのVoteをカウントできることを確認
      get "/v1/votes/count", params: {
        user_id: @user[:id],
        topic_id: @votes[0][:topic_id],
        sex: @votes[0][:sex],
        age: @votes[0][:age],
      }
      json = JSON.parse(response.body)
      expect(response.status).to eq(200)
      # 結果が選択肢ごとのHashであることを確認
      expect(json).to be_kind_of(Hash)
    end

    it 'get a voted status by user' do
      # :user_idと:topic_idを入力するとvoted_statusをBooleanで返すことを確認
      get "/v1/votes", params: @params
      json = JSON.parse(response.body)
      expect(response.status).to eq(200)
      expect(json["voted_status"]).to be_kind_of(TrueClass)

      get "/v1/votes", params: {
        topic_id: @topic[:id],
        chosen_option: @votes[0][:chosen_option],
      }
      json = JSON.parse(response.body)
      expect(response.status).to eq(200)
      expect(json["voted_status"]).to be_kind_of(FalseClass)
    end

    it 'create a new vote' do
      # 入力するUserごとにVoteが成功するか否か確認
      male_user = create(:user, sex: "男性")
      old_user = create(:user, age: 40)

      # Topicのsex, ageと合致するUserの場合、すでに作成済のVoteが存在するのでVoteは増えないことを確認
      expect do
        post "/v1/votes", params: @params
      end.to change(Vote, :count).by(0)
      expect(response).to(be_successful)

      # すでに作成済のVoteを削除
      vote = Vote.find_by(@params)
      vote.destroy

      expect do
        post "/v1/votes", params: @params
      end.to change(Vote, :count).by(1)
      expect(response).to(be_successful)

      # TopicとUserのsexが異なる場合、失敗
      expect do
        post "/v1/votes", params: { user_id: male_user[:id], topic_id: @topic[:id] }
      end.to change(Vote, :count).by(0)

      # TopicとUserのageが異なる場合、失敗
      expect do
        post "/v1/votes", params: { user_id: old_user[:id], topic_id: @topic[:id] }
      end.to change(Vote, :count).by(0)
    end

    it 'destroy a vote' do
      # Voteが削除できることを確認
      Vote.create!(@params)

      expect do
        delete "/v1/votes", params: @params
      end.to change(Vote, :count).by(-1)
      expect(response).to(be_successful)
    end

  end
end
