class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def welcome 
    Welcome 
  end
  
end
