class CreateIngredientsDish < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients_dishes do |t|
      t.references :ingredient, foreign_key: true
      t.references :dish, foreign_key: true
    end
  end
end
