class AddRelationDishesIngredients < ActiveRecord::Migration[5.2]
  def change
    add_reference :dishes_ingredients, :ingredients, foreign_key: true
    add_reference :dishes_ingredients, :dishes, foreign_key: true
  end
end
