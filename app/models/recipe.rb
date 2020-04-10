class Recipe < ApplicationRecord
    has_many :ingredients
    belongs_to :user
    has_many :comments
    has_many users, through: comments

    validates :title, presence: true 
    
end
