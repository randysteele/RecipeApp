class AddRecipeToIngredients < ActiveRecord::Migration[6.0]
  def change
    add_column :ingredients, :recipe, :string
  end
end
