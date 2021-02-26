class DropIngredientDishees < ActiveRecord::Migration[5.2]
  def change
    drop_table :ingredient_dishees
  end
end
