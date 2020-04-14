class Ingredient < ApplicationRecord    
    has_many :users
    belongs_to :recipes
end
