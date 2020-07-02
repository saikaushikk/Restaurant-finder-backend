class Restaurantm < ApplicationRecord
    # belongs_to :location
    validates:name, presence: true, uniqueness: true
    validates:locations_id, presence: true
    validates:address, presence: true, uniqueness: true
    validates:image, presence: true, uniqueness: true, url: true
end
