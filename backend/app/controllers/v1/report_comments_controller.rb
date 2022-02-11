# start URI from /v1/
module V1
  class ReportCommentsController < ApplicationController

    # GET /report-comments/:comment_id
    def count_reports
      cnt = ReportComment.where(comment_id: params[:comment_id]).all.count()
      json_response(report_num: cnt)
    end
  end

end