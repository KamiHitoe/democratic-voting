# start URI from /v1/
module V1
  class VotesController < ApplicationController
    before_action :get_voted_status

    # GET /votes
    def show
      # this makes vote button enable or disable
      json_response(voted_status: @voted_status)
    end

    # POST /votes
    def create
      if @voted_status
        puts 'already voted'
      else
        user = User.find(vote_params[:user_id])
        topic = Topic.find(vote_params[:topic_id])
        if (!topic.sex || topic.sex == user.sex) && (!topic.age || topic.age == user.age)
          Vote.create!(vote_params)
        else
          puts "invalid user"
        end
      end
    end

    # DELETE /votes
    def destroy
      if @voted_status
        vote = Vote.find_by(vote_params)
        vote.destroy
      else
        puts 'not existed'
      end
    end

    private

    def vote_params
      # whitelist params
      params.permit(:user_id, :topic_id)
      # params = {user_id: user_id, topic_id: topic_id} given from routes
    end

    def get_voted_status
      @voted_status = !Vote.where(vote_params).empty?
    end

  end
end