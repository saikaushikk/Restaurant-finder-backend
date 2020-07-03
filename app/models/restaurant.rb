class Restaurant < ApplicationRecord
    # belongs_to :location
    validates:name, presence: true, uniqueness: true
    validates:location_id, presence: true
    validates:address, presence: true, uniqueness: true
    validates:image, presence: true, uniqueness: true, url: true
end
