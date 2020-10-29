class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.integer :quantity
      t.string :units
      t.integer :calories_per_unit
    end
  end
end
