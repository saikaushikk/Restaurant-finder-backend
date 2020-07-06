class UsersController < ApplicationController
     before_action :authorized, only: [:profile]

    # REGISTER
    def create
      @user = User.create(user_params)
      if @user.valid?
        token = encode_token({user_id: @user.id})
        render json: {user: @user, token: token}
      else
        render json: {error: "Invalid user credentials"}, status: 400
      end
    end
    
    # LOGGING IN
    def login
      @user = User.find_by(username: params[:username]) || User.find_by(phone_number: params[:phone_number])
  
      if @user && @user.authenticate(params[:password])
        token = encode_token({user_id: @user.id})
        render json: {user: @user, token: token}
      else
        render json: {error: "Invalid username or password"}, status: 401
      end
    end
    # DELETE A USER 
    def delete
      # @user = User.find_by(id: params[:id])
      if logged_in_user && logged_in_user.destroy
        render json: {status: "ok"}
      else
        render json: {status: "please log in"}, status: 400
      end
    end
    #SHOW USER DETAILS GIVEN AUTH TOKEN 
    #{"Authorization": "Bearer <token>"}
    def profile
        render json: logged_in_user
    end
    private
  
    def user_params
      params.permit(:username, :password, :phone_number)
    end
end
