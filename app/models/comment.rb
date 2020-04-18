class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :recipe   
  # has_many :users, through: :comments
  validates :content, length: {minimum: 10}
  validates :content, length: {maximum: 200}
end
