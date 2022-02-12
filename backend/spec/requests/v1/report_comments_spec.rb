require 'rails_helper'

RSpec.describe(ReportComment, type: :request) do
  describe "test ReportComments request" do
    before(:each) do
      @user = create(:user)
      @topic = create(:topic)
      @comment = create(:comment, topic_id: @topic[:id])
      @params = { user_id: @user[:id], comment_id: @comment[:id] }
    end

    it 'get the number of reports' do
      # コメントに対する通報数を取得
      get "/v1/count-report-comments", params: {
        comment_id: @comment[:id],
      }
      json = JSON.parse(response.body)
      expect(response.status).to(eq(200))
      expect(json["reported_num"]).to be_kind_of(Integer)
    end

    it 'get a reported status by user' do
      # 任意のユーザに対して通報の有無を取得
      get "/v1/report-comments", params: @params
      json = JSON.parse(response.body)
      expect(response.status).to(eq(200))
      expect(json["reported_status"]).to be_kind_of(TrueClass) | be_kind_of(FalseClass)
    end

    it 'create a new report' do
      # 新たな通報を作成
      expect do
        post "/v1/report-comments", params: @params
      end.to(change(ReportComment, :count).by(1))
    end

    it 'destroy the report' do
      ReportComment.create(@params)

      expect do
        delete "/v1/report-comments", params: @params
      end.to(change(ReportComment, :count).by(-1))
    end

  end
end
