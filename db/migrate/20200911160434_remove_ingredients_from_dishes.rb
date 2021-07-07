class RemoveIngredientsFromDishes < ActiveRecord::Migration[5.2]
  def change
    remove_column :dishes, :ingredients, :string
  end
end
