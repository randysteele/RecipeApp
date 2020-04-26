class User < ApplicationRecord
    has_many :recipes
    has_many :comments
    has_many :ingredients, through: :recipes
    has_many :commented_recipes, through: :comments
    validates :email, uniqueness: true 
    has_secure_password    

    
end
