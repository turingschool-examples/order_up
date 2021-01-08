class CreateIngredientsLists < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients_lists do |t|
      t.references :dish, foreign_key: true
      t.references :ingredient, foreign_key: true

      t.timestamps
    end
  end
end
