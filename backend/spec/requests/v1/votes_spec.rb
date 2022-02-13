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
    end

    it 'get the number of votes grouped by chosen_option' do
      # 性別・年代でソートされた選択肢ごとの投票数を取得
      get "/v1/count-votes", params: {
        user_id: @user[:id],
        topic_id: @votes[0][:topic_id],
        sex: @votes[0][:sex],
        age: @votes[0][:age],
      }
      json = JSON.parse(response.body)
      expect(response.status).to(eq(200))
      # 結果が選択肢ごとのHashであることを確認
      expect(json).to be_kind_of(Hash)
      puts "result count votes: ", json
    end

    it 'get a voted status by user' do
      # user_idとtopic_idを入力するとvoted_statusをBooleanで返す
      get "/v1/votes", params: @params
      json = JSON.parse(response.body)
      expect(response.status).to(eq(200))
      # 結果がBooleanであることを確認
      expect(json["voted_status"]).to be_kind_of(TrueClass) | be_kind_of(FalseClass)
    end

    it 'create a new vote' do
      # userとtopicの性別・年代が合致した時のみ投票可能
      male_user = create(:user, sex: "男性")
      old_user = create(:user, age: 40)
      # validate user
      expect do
        post "/v1/votes", params: @params
      end.to(change(Vote, :count).by(1))

      # invalid sex
      expect do
        post "/v1/votes", params: { user_id: male_user[:id], topic_id: @topic[:id] }
      end.to(change(Vote, :count).by(0))

      # invalid age
      expect do
        post "/v1/votes", params: { user_id: old_user[:id], topic_id: @topic[:id] }
      end.to(change(Vote, :count).by(0))
    end

    it 'destroy a vote' do
      # create vote record to be deleted
      Vote.create!(@params)

      expect do
        delete "/v1/votes", params: @params
      end.to(change(Vote, :count).by(-1))

      # even though requesit is success, response.body is not exist
      expect(response).to(be_successful)
    end

  end
end
