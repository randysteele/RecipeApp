class Recipe < ApplicationRecord
    belongs_to :user
    has_many :ingredients      
    has_many :comments
    has_many :users, through: :comments
    validates :title, presence: true 
    validate :is_title_case

    accepts_nested_attributes_for :ingredients    

    before_save :make_title_case

    scope :alpha, -> { order(:title) }

    scope :most_comments, -> { joins(:comments).group('recipes.id').order('count(recipes.id) DESC') }

    
    
    def is_title_case
        if title.split.any?{|w|w[0].upcase != w[0]}
        errors.add(:title, "must be in Title Case, please capitalize the first letter of each word")
        end
    end
     
    def make_title_case
      self.title = self.title.titlecase
    end 

    def self.search(params)
      left_joins(:comments).where("LOWER(recipes.title) LIKE :term OR LOWER(recipes.content) LIKE :term OR LOWER(comments.content) LIKE :term", term: "%#{params}%")
    end

    def self.high_num_ingredients
        something = []
        Recipe.all.each do |recipe|  
        if recipe.ingredients.count > 5 
          something << recipe
        end
        end
        something
    end
end