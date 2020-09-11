class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.integer :calories
      t.references :dishes, foreign_key:true

      t.timestamps
    end
  end
end
