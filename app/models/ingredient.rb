class Ingredient < ApplicationRecord
    has_many :recipes 
    has_many :users
    belongs_to :recipe
end
