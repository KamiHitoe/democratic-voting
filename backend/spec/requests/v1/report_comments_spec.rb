require 'rails_helper'

RSpec.describe(ReportComment, type: :request) do
  describe "test ReportComments request" do
    before(:each) do
      @user = create(:user)
      @topic = create(:topic)
      @comment = create(:comment, topic_id: @topic[:id])
      @params = { user_id: @user[:id], comment_id: @comment[:id] }
      ReportComment.create(@params)
    end

    it 'get the number of reports' do
      # comment[:id]に対するReportCommentの数をカウントできることを確認
      get "/v1/count-report-comments", params: {
        comment_id: @comment[:id],
      }
      json = JSON.parse(response.body)
      expect(response.status).to eq(200)
      expect(json["reported_num"]).to be_kind_of(Integer)
      expect(json["reported_num"]).not_to be_zero
    end

    it 'get a reported status by user' do
      # user[:id]とcomment[:id]に対するreported_statusをBooleanで返すことを確認
      get "/v1/report-comments", params: @params
      json = JSON.parse(response.body)
      expect(response.status).to eq(200)
      expect(json["reported_status"]).to be_kind_of(TrueClass) | be_kind_of(FalseClass)
    end

    it 'create a new report' do
      # ReportCommentが作成できることを確認

      # すでに作成済のReportCommentが存在するのでReportCommentは増えないことを確認
      expect do
        post "/v1/report-comments", params: @params
      end.to change(ReportComment, :count).by(0)
      expect(response).to be_successful

      # すでに作成済のReportCommentを削除
      report = ReportComment.find_by(@params)
      report.destroy

      expect do
        post "/v1/report-comments", params: @params
      end.to change(ReportComment, :count).by(1)
      expect(response).to be_successful
    end

    it 'destroy the report' do
      # ReportCommentが削除できることを確認

      # すでに作成済のReportCommentを削除できることを確認
      expect do
        delete "/v1/report-comments", params: @params
      end.to change(ReportComment, :count).by(-1)
      expect(response).to be_successful

      # ReportCommentが存在しないので削除できないことを確認
      expect do
        delete "/v1/report-comments", params: @params
      end.to change(ReportComment, :count).by(0)
      expect(response).to be_successful
    end

  end
end
