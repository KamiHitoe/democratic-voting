require 'rails_helper'

RSpec.describe(ReportComment, type: :request) do
  describe "test ReportComments request" do
    before(:each) do
      @user = create(:user)
      @topic = create(:topic)
      @comment = create(:comment, topic_id: @topic[:id])
    end

    it 'get the number of reports' do
      # コメントに対する通報数を取得
      get "/v1/report-comments/#{@comment[:id]}"
      json = JSON.parse(response.body)
      expect(response.status).to(eq(200))
    end

    it 'create a new report' do
      # 新たな通報を作成
      expect do
        post "/v1/report-comments"
      end
    end


  end
end
