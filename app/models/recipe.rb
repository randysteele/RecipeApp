class Recipe < ApplicationRecord
    has_many :ingredients
    belongs_to :user
    has_many :comments
    has_many :comments, through: :users
    validates :title, presence: true 
    validate :is_title_case
    accepts_nested_attributes_for :ingredients    
    
 
  
    before_save :make_title_case
    scope :alpha, -> { order(:title) }


    def is_title_case
        if title.split.any?{|w|w[0].upcase != w[0]}
          errors.add(:title, "Title must be in title case, please capitalize the first letter")
        end
    end
     
    def make_title_case
        self.title = self.title.titlecase
    end

end
