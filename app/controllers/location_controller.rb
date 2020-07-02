class LocationController < ApplicationController
    #Create location
    def create
        if !logged_in_user
          render json: {error: "Invalid token"}, status: 401
          return
        end
        @location = Location.create(location_params)
        if !@location.valid?
          render json: {error: "Invalid location credentials"}, status: 400
        else
         render json: {location: @location}
        end
    end
    #Delete a location
    def delete
        if !logged_in_user
          render json: {error: "Invalid token" }, status: 401
          return
        end
        @location = Location.find_by(id: params[:id])
        if !@location
          render json: {error: "location id does not exist" }, status: 400
        else
          @location.destroy
         render json: {status: "ok"}
        end
    end
    #show a location given id
    def show
        @location = Location.where(id: params[:id]).select("id", "name", "latitude", "longtitude").first
        if @location
          render json: { location: @location }
        else
          render json: {status: "location id does not exist"}, status: 400
        end
    end
    #list all available locations
    def list
        @locations = Location.select("id", "name", "latitude", "longtitude")
        render json: {locations: @locations}
    end
    def location_params
        params.permit(:name, :latitude, :longtitude)
    end
end
