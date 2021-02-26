class CreateDishIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :dish_ingredients do |t|
      t.references :dish, foreign_key: true
      t.references :ingredients, foreign_key: true

      t.timestamps
    end
  end
end
