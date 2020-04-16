class AddRecipeIdToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :recipe_id, :integer
    add_index :comments, :recipe_id
  end
end
