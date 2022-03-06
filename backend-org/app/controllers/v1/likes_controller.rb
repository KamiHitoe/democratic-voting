# start URI from /v1/
module V1
  class LikesController < ApplicationController
    before_action :get_liked_status, except: :count_likes

    # GET /likes/count
    def count_likes
      cnt = Like.where(comment_id: params[:comment_id]).all.count()
      json_response(liked_num: cnt)
    end

    # GET /likes
    def show_status
      # this makes like button enable or disable
      json_response(liked_status: @liked_status)
    end

    # POST /likes
    def create
      if @liked_status
        puts 'already exist'
      else
        Like.create!(like_params)
      end
    end

    # DELETE /likes
    def destroy
      if @liked_status
        like = Like.find_by(like_params)
        like.destroy
      else
        puts 'not exist'
      end
    end

    private

    def like_params
      # whitelist params
      params.permit(:user_id, :comment_id)
    end

    def get_liked_status
      if like_params[:user_id] != nil
        @liked_status = !Like.where(like_params).empty?
      else
        @liked_status = false
      end
    end

  end
end
