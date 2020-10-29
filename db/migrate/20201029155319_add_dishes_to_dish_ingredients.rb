class AddDishesToDishIngredients < ActiveRecord::Migration[5.2]
  def change
    add_reference :dish_ingredients, :dish, foreign_key: true
  end
end
