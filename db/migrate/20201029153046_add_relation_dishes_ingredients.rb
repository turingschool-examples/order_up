class AddRelationDishesIngredients < ActiveRecord::Migration[5.2]
  def change
    add_reference :ingredients_dishes, :ingredients, foreign_key: true
    add_reference :ingredients_dishes, :dishes, foreign_key: true
  end
end
