require 'rails_helper'

RSpec.describe(ReportTopic, type: :request) do
  describe "test ReportTopics request" do
    before(:each) do
      @user = create(:user)
      @topic = create(:topic)
      @params = { user_id: @user[:id], topic_id: @topic[:id] }
    end

    it 'get the number of reports' do
      # コメントに対する通報数を取得
      get "/v1/report-topics", params: {
        topic_id: @topic[:id],
      }
      json = JSON.parse(response.body)
      expect(response.status).to(eq(200))
    end

    it 'create a new report' do
      # 新たな通報を作成
      expect do
        post "/v1/report-topics", params: @params
      end.to(change(ReportTopic, :count).by(1))
    end

    it 'destroy the report' do
      ReportTopic.create(@params)

      expect do
        delete "/v1/report-topics", params: @params
      end.to(change(ReportTopic, :count).by(-1))
    end

  end
end
