# start URI from /v1/
module V1
  class LikesController < ApplicationController
    before_action :get_liked_status, only: %i[check_liked create destroy]

    # GET /likes/:comment_id
    def count_likes
      cnt = Like.where(comment_id: params[:comment_id]).all.count()
      json_response(like_num: cnt)
    end

    # GET /likes/:user_id/:comment_id
    def check_liked
      # this makes like button enable or disable
      json_response(liked_status: @liked_status)
    end

    # POST /likes/:user_id/:comment_id
    def create
      if @liked_status
        puts 'already liked'
      else
        Like.create!(like_params)
      end
    end

    # DELETE /likes/:user_id/:comment_id
    def destroy
      if @liked_status
        like = Like.find_by(like_params)
        like.destroy
      else
        puts 'not existed'
      end
    end

    private

    def like_params
      # whitelist params
      # params = {user_id: user_id, comment_id: comment_id} given from routes
      params.permit(:user_id, :comment_id)
    end

    def get_liked_status
      @liked_status = !Like.where(like_params).empty?
    end

  end
end
