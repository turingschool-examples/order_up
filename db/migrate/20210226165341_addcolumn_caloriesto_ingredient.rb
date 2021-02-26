class AddcolumnCaloriestoIngredient < ActiveRecord::Migration[5.2]
  def change
    add_column :ingredients, :calories, :float
  end
end
