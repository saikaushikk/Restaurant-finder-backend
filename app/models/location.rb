class Location < ApplicationRecord
    REQUIREMENTS = /\A(\+|-)?(?:90(?:(?:\.0{1,6})?)|(?:[0-9]|[1-8][0-9])(?:(?:\.[0-9]{1,6})?))/x
    validates:name, presence: true, uniqueness: true
    validates:longtitude, presence: true, format: REQUIREMENTS
    validates:latitude, presence: true, format: REQUIREMENTS
end
