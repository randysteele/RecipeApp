class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :recipe  
  validates :content, length: {minimum: 10}
  validates :content, length: {maximum: 200}
end
