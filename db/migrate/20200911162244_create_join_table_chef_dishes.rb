class CreateJoinTableChefDishes < ActiveRecord::Migration[5.2]
  def change
    create_join_table :chefs, :dishes do |t|
      t.references :chef, foreign_key: true
      t.references :dish, foreign_key: true

      # t.index [:chef_id, :dish_id]
      # t.index [:dish_id, :chef_id]
    end
  end
end
