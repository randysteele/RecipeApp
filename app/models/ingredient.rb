class Ingredient < ApplicationRecord    
    has_many :users
    has_many :recipes
    validate :is_title_case
    before_save :make_title_case

  def is_title_case
    if name.split.any?{|w|w[0].upcase != w[0]}
      errors.add(:name, "Must be in title case, (please capitalize the first letter of each word)")
    end
  end
 
  def make_title_case
    self.name = self.name.titlecase
  end
end
