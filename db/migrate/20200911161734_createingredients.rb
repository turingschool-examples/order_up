class Createingredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.string :description
      t.references :dishes, foreign_key: true

      t.timestamps
    end
  end
end
