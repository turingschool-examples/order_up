class AddIngredientToDishes < ActiveRecord::Migration[5.2]
  def change
    add_reference :dishes, :ingredient, foreign_key: true
  end
end
