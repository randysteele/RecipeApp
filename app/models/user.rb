class User < ApplicationRecord
    has_many :recipes
    has_many :comments
    has_many :ingredients, through: :recipes
    has_many :commented_recipes, through: :comments
    has_secure_password
    validates :email, uniqueness: true 

    
end
