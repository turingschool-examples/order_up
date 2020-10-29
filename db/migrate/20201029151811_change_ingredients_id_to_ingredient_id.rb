class ChangeIngredientsIdToIngredientId < ActiveRecord::Migration[5.2]
  def change
    rename_column :dish_ingredients, :ingredients_id, :ingredient_id
  end
end
