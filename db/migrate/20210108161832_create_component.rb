class CreateComponent < ActiveRecord::Migration[5.2]
  def change
    create_table :components do |t|
      t.references :dish, foreign_key: true
      t.references :ingredient, foreign_key: true
      t.integer :amount
    end
  end
end
