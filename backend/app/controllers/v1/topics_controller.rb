# start URI from /v1/
module V1
  class TopicsController < ApplicationController
    # run below function before the action run
    before_action :get_topic, only: %i[show update destroy]

    # GET /topics
    def index
      if params[:q] == "ranking"
        topics = Topic.order("voted_num DESC")
      elsif params[:q] == "trend"
        topics = Topic.where("created_at > ?", 3.days.ago).order("voted_num DESC")
      else
        topics = Topic.order("created_at DESC")
      end
      json_response(topics)
      puts params
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

    # GET /search?query=:query
    def search
      # /:category_idからcategory_idを取得
      if params[:category_id]
        topics = Topic.where(category_id: params[:category_id])
        if params[:period] == "weekly"
          topics = topics.where("created_at > ?", 1.weeks.ago)
        elsif params[:period] == "monthly"
          topics = topics.where("created_at > ?", 1.months.ago)
        elsif params[:period] == "yearly"
          topics = topics.where("created_at > ?", 1.years.ago)
        end
        
        if params[:sort] == "ranking"
          topics = topics.order("voted_num DESC")
        else
          # 条件指定がない場合は新着順
          topics = topics.order("created_at DESC")
        end
      else
        topics = Topic.all
      end
      json_response(topics)
    end

    # PUT /topics/:id
    def update
      chosen_option = params[:chosen_option]
      @topic.increment!(chosen_option)
      @topic.increment!(:voted_num)
      head(:no_content)
    end

    # DELETE /topics/:id
    def destroy
      @topic.destroy
      head(:no_content)
    end

    private

    def topic_params
      # whitelist params
      params.permit(:user_id, :category_id, :title, :description, :option_1,
                    :option_2, :option_3, :option_4, :option_1_num, :option_2_num, :option_3_num, :option_4_num, :img_path)
    end

    def get_topic
      @topic = Topic.find(params[:id])
    end
  end
end
