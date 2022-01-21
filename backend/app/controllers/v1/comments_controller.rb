# start URI from /v1/
module V1
  class CommentsController < ApplicationController
    # run below function before the action run
    before_action :get_topic
    before_action :get_topic_comment, only: [:show, :destroy]

    # GET /topics/:topic_id/comments
    def index
      json_response(@topic.comments)
    end

    # POST /topics/:topic_id/comments
    def create
      @topic.comments.create!(comment_params)
      json_response(@topic, :created)
    end

    # GET /topics/:topic_id/comments/:id
    def show
      json_response(@comment)
    end

    # DELETE /topics/:topic_id/comments/:id
    def destroy
      @comment.destroy
      head :no_content
    end

    private

    def comment_params
      # whitelist params
      params.permit(:user_id, :parent_id, :text, :like_num)
    end

    def get_topic
      @topic = Topic.find(params[:topic_id])
    end

    def get_topic_comment
      @comment = @topic.comments.find_by!(id: params[:id]) if @topic
    end
  end
end
