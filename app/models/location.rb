class Location < ApplicationRecord
    has_many :restaurantm 
    LAT_REQUIREMENTS = /\A(\+|-)?(?:90(?:(?:\.0{1,6})?)|(?:[0-9]|[1-8][0-9])(?:(?:\.[0-9]{1,6})?))\z/
    LON_REQUIREMENTS = /\A(\-?([1]?[0-7]?[0-9](\.\d+)?|180((.[0]+)?)))\z/
    validates:name, presence: true, uniqueness: true
    validates:longtitude, presence: true, format: LON_REQUIREMENTS
    validates:latitude, presence: true, format: LAT_REQUIREMENTS
end
