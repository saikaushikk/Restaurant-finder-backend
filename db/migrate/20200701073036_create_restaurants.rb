class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :locations_id
      t.string :description
      t.string :image
      t.string :address

      t.timestamps
    end
  end
end
