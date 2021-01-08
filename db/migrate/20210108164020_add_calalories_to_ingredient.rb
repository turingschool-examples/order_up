class AddCalaloriesToIngredient < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :ingredient_quantity, :integer
  end
end
