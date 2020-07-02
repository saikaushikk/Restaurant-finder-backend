class CreateRestaurantms < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurantms do |t|
      t.string :name
      t.string :location_id
      t.string :description
      t.string :image
      t.string :address

      t.timestamps
    end
  end
end
