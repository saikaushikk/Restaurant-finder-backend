class LocationController < ApplicationController
    #Create location
    def create
        @location = Location.create(user_params)
        if logged_in_user && @location.valid?
          render json: {location: @location}
        else
          @location.destroy
          render json: {error: "Invalid location credentials or invalid token"}, status: 401
        end
    end
    #Delete a location
    def delete
        @location = Location.find_by(id: params[:id])
        if logged_in_user && @location && @location.destroy
          render json: {status: "ok"}
        else
          render json: {status: "invalid token or location id does not exist"}, status: 401
        end
    end
    def show
        @location = Location.find_by(id: params[:id])
        if @location
          render json: {location: @location}
        else
          render json: {status: "location id does not exist"}, status: 400
        end
    end
    def list
        locations = Location.select(:id, :name, :latitude, :longtitude)
        render json: {locations: locations}
    end
    def user_params
        params.permit(:name, :latitude, :longtitude)
    end
end
