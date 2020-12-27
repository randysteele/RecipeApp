class ChangeIngredientQuantityFromIntegerToString < ActiveRecord::Migration[6.0]
  def change
    def up 
      change_column :ingredients, :quantity, :string 
    end

    def down
      change_column :ingredients, :quantity, :integer
    end
  end
end
