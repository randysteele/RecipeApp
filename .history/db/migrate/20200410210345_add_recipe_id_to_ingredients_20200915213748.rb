class AddRecipeIdToIngredients < ActiveRecord::Migration[6.0]
  def change
    add_column :ingredients, :recipe_id, :text
    add_index :ingredients, :recipe_id
  end
end
