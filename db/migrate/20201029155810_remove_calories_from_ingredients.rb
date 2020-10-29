class RemoveCaloriesFromIngredients < ActiveRecord::Migration[5.2]
  def change
    remove_column :ingredients, :calories, :string
  end
end
