class AddChefsToIngredients < ActiveRecord::Migration[5.2]
  def change
    add_reference :ingredients, :chef, foreign_key: true
  end
end
