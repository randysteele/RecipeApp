class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.text :title
      t.text :ingredients
      t.text :content

      t.timestamps
    end
  end
end
