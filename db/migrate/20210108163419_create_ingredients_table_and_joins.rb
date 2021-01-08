class CreateIngredientsTableAndJoins < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.integer :calories
    end

    create_table :dish_ingredients do |t|
      t.references :dish, foreign_key: true
      t.references :ingredient, foreign_key: true
    end
  end
end
