# start URI from /v1/
module V1
  class TopicsController < ApplicationController
    # run below function before the action run
    before_action :get_topic, only: [:show, :destroy]

    # GET /topics
    def index
      @topics = Topic.all
      json_response(@topics)
    end

    # POST /topics
    def create
      @topic = Topic.create!(topic_params)
      json_response(@topic, :created)
    end

    # GET /topics/:id
    def show
      json_response(@topic)
    end

    # DELETE /topics/:id
    def destroy
      @topic.destroy
      head :no_content
    end

    private

    def topic_params
      # whitelist params
      params.permit(:user_id, :category_id, :title, :description, :option_1, :option_2, :option_3, :option_4, :option_1_num, :option_2_num, :option_3_num, :option_4_num, :img_path)
    end

    def get_topic
      @topic = Topic.find(params[:id])
    end
  end
end