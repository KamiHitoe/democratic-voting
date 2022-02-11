# start URI from /v1/
module V1
  class ReportTopicsController < ApplicationController

    # GET /report-topics
    def count_reports
      cnt = ReportTopic.where(topic_id: params[:topic_id]).all.count()
      json_response(report_num: cnt)
    end

    # POST /report-topics
    def create
      ReportTopic.create!(report_params)
    end

    # DELETE /report-topics
    def destroy
      report = ReportTopic.find_by(report_params)
      report.destroy
    end

    private

    def report_params
      params.permit(:user_id, :topic_id)
    end


  end
end