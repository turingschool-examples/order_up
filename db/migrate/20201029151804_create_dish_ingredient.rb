class CreateDishIngredient < ActiveRecord::Migration[5.2]
  def change
    create_table :dish_ingredients do |t|
      t.bigint :dish_id
      t.bigint :ingredient_id
    end
  end
end
