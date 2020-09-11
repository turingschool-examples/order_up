class AddIngredientsToDish < ActiveRecord::Migration[5.2]
  def change
    add_column :dishes, :ingredients, array: true, default: []
    add_reference :dishes, :dish, foreign_key: true
  end
end
