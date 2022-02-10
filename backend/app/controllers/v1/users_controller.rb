# start URI from /v1/
module V1
  class UsersController < ApplicationController
    # run below function before the action run
    before_action :get_user, only: %i[show update]
    before_action :get_current_user, only: %i[index create]

    # GET /users?uid=params[:uid]
    def index
      json_response(@current_user)
    end

    # POST /users
    def create
      if @current_user
        puts "this user already exists"
      else
        # まだユーザー登録されていない場合のみPOST可能
        user = User.create!(user_params)
        json_response(user, :created)
      end
    end

    # GET /users/:id
    def show
      json_response(@user)
    end

    # PUT /users/:id
    def update
      @user.update(user_params)
      head(:no_content)
    end

    private

    def user_params
      # whitelist params
      params.permit(:uid, :age, :sex)
    end

    def get_user
      @user = User.find(params[:id])
    end

    def get_current_user
      @current_user = User.find_by(uid: params[:uid])
    end

  end
end
