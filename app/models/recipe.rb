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

    scope :with_most_comments, -> { where("LENGTH(comments) > 5") }   


    def is_title_case
        if title.split.any?{|w|w[0].upcase != w[0]}
          errors.add(:title, "must be in Title Case, please capitalize the first letter")
        end
    end
     
    def make_title_case
        self.title = self.title.titlecase
    end
end
