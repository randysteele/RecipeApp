class Recipe < ApplicationRecord
    has_many :ingredients
    belongs_to :user
    has_many :comments
    has_many :users, through: :comments

    validates :title, presence: true 

    accepts_nested_attributes_for :ingredients

    # def ingredients_attributes=(ingredient)
    #     self.ingredient = Ingredient.find_or_create_by(name: ingredient[:name])
    #     self.ingredient.update(ingredient)
    #   end
    
end
