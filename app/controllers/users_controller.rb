class UsersController < ApplicationController
    before_action :authorized, only: [:auto_login]

    # REGISTER
    def create
      @user = User.create(user_params)
      if @user.valid?
        token = encode_token({user_id: @user.id})
        render json: {user: @user, token: token}
      else
        render json: {error: "Invalid username or password"}
      end
    end
  
    # LOGGING IN
    def login
      @user = User.find_by(username: params[:username]) || User.find_by(phone_number: params[:phone_number])
  
      if @user && @user.authenticate(params[:password])
        token = encode_token({user_id: @user.id})
        render json: {user: @user, token: token}
      else
        render json: {error: "Invalid username or password"}
      end
    end
  
    def delete
      @user = User.find_by(id: params[:id])
      if @user && @user.destroy
        render json: {status: "ok"}
      else
        render json: {status: "invalid id or user does not exist"}
      end
    end

    def profile
      @user = User.find_by(id: params[:id])
      if @user
        render json: {user: @user}
      else
        render json: {status: "invalid id or user does not exist"}
      end
      
    end

    private
  
    def user_params
      params.permit(:username, :password, :phone_number)
    end
end
