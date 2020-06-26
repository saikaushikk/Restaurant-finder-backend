class User < ApplicationRecord
    has_secure_password
    PASSWORD_REQUIREMENTS = /\A
        (?=.{8,}) #Atleast 8 characters
        (?=.*\d)  #Contains one number
        (?=.*[a-z]) #one lowercase letter
        (?=.*[A-Z]) #one upper case letter
        (?=.*[[:^alnum]]) #one symbol
    /x
    PHONENUMBER_REQUIREMENTS = /\A
        (?=.*\d$)  #Contains only number
    /x
    validates :password, format: PASSWORD_REQUIREMENTS
    validates :phone_number, presence: true, format: PHONENUMBER_REQUIREMENTS, length: { is: 10 }, uniqueness: true
    validates :username, presence: true, uniqueness: true
end
