class CreateDishIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :dish_ingredients do |t|
      t.references :dish
      t.references :ingredient
    end
  end
end
