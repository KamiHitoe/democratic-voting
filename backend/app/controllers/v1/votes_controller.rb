# start URI from /v1/
module V1
  class VotesController < ApplicationController
    before_action :get_voted_status

    # GET /count-votes
    # params include :sex, :age, :chosen_option
    # return ({ 1: 1_num, 2: 2_num, 3: 3_num, 4: 4_num })
    def count_votes
      # write group by chosen_option logic where sex, age
      result = Vote.where(topic_id: params[:topic_id])

      if params[:sex] == "male"
        result = result.where(sex: "male")
      elsif params[:sex] == "female"
        result = result.where(sex: "female")
      end

      if params[:age] == "10"
        result = result.where(age: 10)
      elsif params[:age] == "20"
        result = result.where(age: 20)
      elsif params[:age] == "30"
        result = result.where(age: 30)
      elsif params[:age] == "40"
        result = result.where(age: 40)
      elsif params[:age] == "50"
        result = result.where(age: 50)
      end

      result = result.group(:chosen_option).count()
      # render Hash
      json_response(result)
    end

    # GET /votes
    def show_status
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
      # params = {user_id: user_id, topic_id: topic_id} given from routes
      params.permit(:user_id, :topic_id, :sex, :age, :chosen_option)
    end

    def get_voted_status
      @voted_status = !Vote.where(vote_params).empty?
    end

  end
end