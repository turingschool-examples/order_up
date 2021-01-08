class Addcolumntojoinstable < ActiveRecord::Migration[5.2]
  def change
    add_column :dish_ingredients, :count, :integer
  end
end
