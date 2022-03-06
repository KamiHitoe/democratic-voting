# start URI from /v1/
module V1
  class ReportCommentsController < ApplicationController
    before_action :get_reported_status, except: :count_reports

    # GET /report/comments/count
    def count_reports
      cnt = ReportComment.where(comment_id: params[:comment_id]).all.count()
      json_response(reported_num: cnt)
    end

    # GET /report-topics
    def show_status
      json_response(reported_status: @reported_status)
    end

    # POST /report/comments
    def create
      if @reported_status
        puts 'already exist'
      else
        ReportComment.create!(report_params)
      end
    end

    # DELETE /report/comments
    def destroy
      if @reported_status
        report = ReportComment.find_by(report_params)
        report.destroy
      else
        puts 'not exist'
      end
    end

    private

    def report_params
      params.permit(:user_id, :comment_id)
    end

    def get_reported_status
      @reported_status = !ReportComment.where(report_params).empty?
    end

  end
end