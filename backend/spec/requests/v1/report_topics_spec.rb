require 'rails_helper'

RSpec.describe(ReportTopic, type: :request) do
  describe "test ReportTopics request" do
    before(:each) do
      @user = create(:user)
      @topic = create(:topic)
      @params = { user_id: @user[:id], topic_id: @topic[:id] }
      ReportTopic.create(@params)
    end

    it 'get the number of reports' do
      # topic[:id]に対するReportTopicの数をカウントできることを確認
      get "/v1/count-report-topics", params: {
        topic_id: @topic[:id],
      }
      json = JSON.parse(response.body)
      expect(response.status).to(eq(200))
      expect(json["reported_num"]).to be_kind_of(Integer)
      expect(json["reported_num"]).not_to be_zero
    end

    it 'get a reported status by user' do
      # user[:id]とtopic[:id]に対するreported_statusをBooleanで返すことを確認
      get "/v1/report-topics", params: @params
      json = JSON.parse(response.body)
      expect(response.status).to(eq(200))
      expect(json["reported_status"]).to be_kind_of(TrueClass) | be_kind_of(FalseClass)
    end

    it 'create a new report' do
      # ReportTopicが作成できることを確認

      # すでに作成済のReportTopicが存在するのでReportTopicは増えないことを確認
      expect do
        post "/v1/report-topics", params: @params
      end.to change(ReportTopic, :count).by(0)
      expect(response).to be_successful

      # すでに作成済のReportTopicを削除
      report = ReportTopic.find_by(@params)
      report.destroy

      expect do
        post "/v1/report-topics", params: @params
      end.to change(ReportTopic, :count).by(1)
      expect(response).to be_successful
    end

    it 'destroy the report' do
      # ReportTopicが削除できることを確認

      # すでに作成済のReportTopicを削除できることを確認
      expect do
        delete "/v1/report-topics", params: @params
      end.to change(ReportTopic, :count).by(-1)
      expect(response).to be_successful

      # ReportTopicが存在しないので削除できないことを確認
      expect do
        delete "/v1/report-topics", params: @params
      end.to change(ReportTopic, :count).by(0)
      expect(response).to be_successful
    end

  end
end
