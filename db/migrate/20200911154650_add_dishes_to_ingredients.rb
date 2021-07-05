class AddDishesToIngredients < ActiveRecord::Migration[5.2]
  def change
    add_reference :ingredients, :dish, foreign_key: true
  end
end
