class AddAttributesToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :title, :string
    add_column :recipes, :content, :string
  end
end
