# start URI from /v1/
module V1
  class UsersController < ApplicationController
    # run below function before the action run
    before_action :get_user, only: %i[show update]

    # POST /users
    def create
      @user = User.create!(user_params)
      json_response(@user, :created)
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
      params.permit(:username, :age, :sex)
    end

    def get_user
      @user = User.find(params[:id])
    end
  end
end
