class AddRecipeToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :recipe, :string
  end
end
