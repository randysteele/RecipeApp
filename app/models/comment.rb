class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  # <%= link_to "See All Comments" recipe_comments_path%>   
end
