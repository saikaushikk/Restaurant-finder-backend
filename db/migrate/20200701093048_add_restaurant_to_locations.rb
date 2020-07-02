class AddRestaurantToLocations < ActiveRecord::Migration[6.0]
  def change
    add_reference :restaurantms , :locations
  end
end
