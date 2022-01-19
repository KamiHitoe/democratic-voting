# start URI from /v1/
module V1
  class CommentsController < ApplicationController
    # run below function before the action run
    before_action :get_comment, only: :show

    # GET /comments
    def index
      @comments = Comment.all
      json_response(@comments)
    end

    # POST /comments
    def create
      @comment = Comment.create!(comment_params)
      json_response(@comment, :created)
    end

    # GET /comments/:id
    def show
      json_response(@comment)
    end

    private

    def comment_params
      # whitelist params
      params.permit(:text, :like_num)
    end

    def get_comment
      @comment = Comment.find(params[:id])
    end
  end
end
