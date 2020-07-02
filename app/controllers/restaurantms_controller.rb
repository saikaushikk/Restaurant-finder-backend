class RestaurantmsController < ApplicationController
    #Create a new restaurant
    def create
        if !logged_in_user
            render json: {error: "Invalid token"}, status: 401
            return
        end
        @restaurant = Restaurantm.create(restaurant_params)
        if !@restaurant.valid?
            render json: {error: "Invalid restaurant credentials"}, status: 400
        else
            render json: {restaurant: @restaurant}
        end
    end
    #Delete a restaurant given its id
    def delete
        if !logged_in_user
          render json: {error: "Invalid token" }, status: 401
          return
        end
        @restaurant = Restaurantm.find_by(id: params[:id])
        if !@restaurant
          render json: {error: "restaurant id does not exist" }, status: 400
        else
          @restaurant.destroy
         render json: {status: "ok"}
        end
    end
    #Get restaurant details given ID
    def get
        @restaurant = Restaurantm.find_by(id: params[:id])
        if @restaurant
          render json: { id: @restaurant.id, name: @restaurant.name, location_id: @restaurant.locations_id, description: @restaurant.description, image_url:@restaurant.image, address:@restaurant.address}
        else
          render json: {error: "location id does not exist"}, status: 400
        end
    end
    #List all restaurants at a given location name
    def list
        @location = Location.find_by(name: params[:name])
        if @location
            @restaurant = Restaurantm.where(locations_id: @location.id)
            if @restaurant
                render json: { restaurant: @restaurant }
            end
        else
            render json: {error: "Invalid location name" }, status: 400
        end
    end

    def restaurant_params
        params.permit(:locations_id, :name, :description, :image, :address)
    end
end
