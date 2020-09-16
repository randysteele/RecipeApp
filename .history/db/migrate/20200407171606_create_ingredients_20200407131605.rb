class CreateIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.integer :quantity
      t.string :measurement

      t.timestamps
    end
  end
end
