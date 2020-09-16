class CreateIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredients do |t|
      t.text :name
      t.integer :quantity
      t.text :measurement

      t.timestamps
    end
  end
end
