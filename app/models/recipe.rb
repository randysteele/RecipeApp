class Recipe < ApplicationRecord
    belongs_to :user
    has_many :ingredients    
    accepts_nested_attributes_for :ingredients 
    has_many :comments
    has_many :users, through: :comments
    validates :title, presence: true 
    validate :is_title_case
         
    before_save :make_title_case
    scope :alpha, -> { order(:title) }

    scope :with_most_comments, -> { where("LENGTH(comments) > 5") }  
    
    # def ingredient_attributes=(ingredient)
    #     self.ingredient = Ingredient.find_or_create_by(name: ingredient[:name])
    #     self.ingredient.update(ingredient)
    #   end


    #   def ingredient_name
    #    self.ingredient ? self.ingredient.name : nil
    # end


    # def ingredient_name=(name)
    #   self.ingredient = Ingredient.find_or_create_by(name: name)
    # end
  
    # def ingredient_name
    #    self.ingredient ? self.ingredient.name : nil
    # end


    def is_title_case
        if title.split.any?{|w|w[0].upcase != w[0]}
          errors.add(:title, "must be in Title Case, please capitalize the first letter of each word")
        end
    end
     
    def make_title_case
        self.title = self.title.titlecase
    end 
end
