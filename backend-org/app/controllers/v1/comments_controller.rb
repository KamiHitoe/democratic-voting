# start URI from /v1/
module V1
  class CommentsController < ApplicationController
    # run below function before the action run
    before_action :get_topic, excpet: [:search_by_id]
    before_action :get_topic_comment, only: %i[show update destroy]

    # GET /topics/:topic_id/comments
    def index
      json_response(@topic.comments)
    end

    # POST /topics/:topic_id/comments
    def create
      user = User.find(comment_params[:user_id])
      if (!@topic.sex || @topic.sex == user.sex) && (!@topic.age || @topic.age == user.age)
        @topic.comments.create!(comment_params)
        json_response(@topic, :created)
      else
        puts "invalid user"
      end
    end

    # GET /topics/:topic_id/comments/:id
    def show
      json_response(@comment)
    end

    # GET /comments/:topic_id/:replied_comment_id
    def get_reply_comments
      puts params[:replied_comment_id]
      comments = Comment.where(parent_id: params[:replied_comment_id]).all
      json_response(comments)
    end

    # it's no use
    # PUT /topics/:topic_id/comments/:id
    # def update
    #   @comment.update(comment_params)
    #   head(:no_content)
    # end

    # DELETE /topics/:topic_id/comments/:id
    def destroy
      @comment.destroy
      head(:no_content)
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

