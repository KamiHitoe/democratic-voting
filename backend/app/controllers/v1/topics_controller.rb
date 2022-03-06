# start URI from /v1/
module V1
  class TopicsController < ApplicationController
    # run below function before the action run
    before_action :get_topic, only: %i[show update destroy]

    # GET /topics
    def index
      if params[:q] == 'ranking'
        topics = Topic.order('voted_num DESC').limit(30)
      elsif params[:q] == 'trend'
        topics = Topic.where('created_at > ?',
                             3.days.ago).order('voted_num DESC').limit(30)
      else
        topics = Topic.order('created_at DESC').limit(30)
      end
      json_response(topics)
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
      topics = if params[:category_id] && params[:category_id] != 'undefined'
                 Topic.where(category_id: params[:category_id])
               else
                 Topic.all
               end

      if params[:period] == 'weekly'
        topics = topics.where('created_at > ?', 1.weeks.ago)
      elsif params[:period] == 'monthly'
        topics = topics.where('created_at > ?', 1.months.ago)
      elsif params[:period] == 'yearly'
        topics = topics.where('created_at > ?', 1.years.ago)
      end

      if params[:sex] == 'male'
        topics = topics.where(sex: 'male')
      elsif params[:sex] == 'female'
        topics = topics.where(sex: 'female')
      end

      if params[:age] == '10'
        topics = topics.where(age: 10)
      elsif params[:age] == '20'
        topics = topics.where(age: 20)
      elsif params[:age] == '30'
        topics = topics.where(age: 30)
      elsif params[:age] == '40'
        topics = topics.where(age: 40)
      elsif params[:age] == '50'
        topics = topics.where(age: 50)
      end

      topics = if params[:sort] == 'ranking'
                 # topics = topics.order("voted_num DESC").offset(params[:page]).limit(1)
                 topics.order('voted_num DESC')
               else
                 # 条件指定がない場合は新着順
                 # topics = topics.order("created_at DESC").offset(params[:page]).limit(1)
                 topics.order('created_at DESC')
               end

      # ServerSidePaginationとClientSidePaginationを分ける場合に使用
      # if params[:keyword]
      #   # キーワード検索の場合、frontendでlimitを指定
      #   json_response(topics)
      # else
      #   # キーワード検索ではない場合、backendでlimitを指定
      #   topics = topics.limit(1)
      # end

      json_response(topics)
    end

    # PUT /topics/:id
    # params[:chosen_option] = 1..4
    # def update
    #   if params[:chosen_option] == "1"
    #     @topic.increment!(:option_1_num)
    #   elsif params[:chosen_option] == "2"
    #     @topic.increment!(:option_2_num)
    #   elsif params[:chosen_option] == "3"
    #     @topic.increment!(:option_3_num)
    #   elsif params[:chosen_option] == "4"
    #     @topic.increment!(:option_4_num)
    #   end

    #   @topic.increment!(:voted_num)
    #   head(:no_content)
    # end

    # DELETE /topics/:id
    def destroy
      @topic.destroy
      head(:no_content)
    end

    private

    def topic_params
      # whitelist params
      params.permit(:user_id, :category_id, :title, :description, :option_1,
                    :option_2, :option_3, :option_4, :option_1_num, :option_2_num, :option_3_num, :option_4_num,
                    :sex, :age, :img_path)
    end

    def get_topic
      @topic = Topic.find(params[:id])
    end
  end
end
