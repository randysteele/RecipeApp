class User < ApplicationRecord
    has_many :recipes
    has_many :comments
    has_many :ingredients, through: :recipes
    has_secure_password
    validates :email, presence: true, uniqueness: true 
end
