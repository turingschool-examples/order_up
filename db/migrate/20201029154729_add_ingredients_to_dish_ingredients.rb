class AddIngredientsToDishIngredients < ActiveRecord::Migration[5.2]
  def change
    add_reference :dish_ingredients, :ingredient, foreign_key: true
  end
end
