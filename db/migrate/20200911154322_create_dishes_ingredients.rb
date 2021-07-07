class CreateDishesIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :dishes_ingredients do |t|
      t.references :dish, foreign_key: true
      t.references :ingredient, foreign_key: true

      t.timestamps
    end
  end
end
