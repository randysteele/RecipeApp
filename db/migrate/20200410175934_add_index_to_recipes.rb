class AddIndexToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_index :recipes, :user_id
  end
end
