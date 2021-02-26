class AddIngredientsCaloriesToDishes < ActiveRecord::Migration[5.2]
  def change
    add_column :dishes, :ingredients, :string
    add_column :dishes, :calories, :integer
  end
end
