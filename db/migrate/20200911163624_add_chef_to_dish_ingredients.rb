class AddChefToDishIngredients < ActiveRecord::Migration[5.2]
  def change
    add_reference :dish_ingredients, :chef, foreign_key: true
  end
end
