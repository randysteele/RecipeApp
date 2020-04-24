class RemoveRecipeFromComments < ActiveRecord::Migration[6.0]
  def change

    remove_column :comments, :recipe, :string
  end
end
