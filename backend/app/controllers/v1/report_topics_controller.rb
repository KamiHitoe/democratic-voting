# start URI from /v1/
module V1
  class ReportTopicsController < ApplicationController
    before_action :get_reported_status, except: :count_reports

    # GET /report/topics/count
    def count_reports
      cnt = ReportTopic.where(topic_id: params[:topic_id]).all.count
      json_response(reported_num: cnt)
    end

    # GET /report/topics
    def show_status
      json_response(reported_status: @reported_status)
    end

    # POST /report/topics
    def create
      if @reported_status
        puts('already exist')
      else
        ReportTopic.create!(report_params)
      end
    end

    # DELETE /report/topics
    def destroy
      if @reported_status
        report = ReportTopic.find_by(report_params)
        report.destroy
      else
        puts('not exist')
      end
    end

    private

    def report_params
      params.permit(:user_id, :topic_id)
    end

    def get_reported_status
      @reported_status = !ReportTopic.where(report_params).empty?
    end
  end
end
