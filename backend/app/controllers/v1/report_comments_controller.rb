# start URI from /v1/
module V1
  class ReportCommentsController < ApplicationController

    # GET /report-comments
    def count_reports
      cnt = ReportComment.where(comment_id: params[:comment_id]).all.count()
      json_response(report_num: cnt)
    end

    # POST /report-comments
    def create
      ReportComment.create!(report_params)
    end

    # DELETE /report-comments
    def destroy
      report = ReportComment.find_by(report_params)
      report.destroy
    end

    private

    def report_params
      params.permit(:user_id, :comment_id)
    end


  end
end