class AddUserIdToRecipe < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :user_id, :integer
  end
end
