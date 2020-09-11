class AddCaloriesToDishes < ActiveRecord::Migration[5.2]
  def change
    add_column :dishes, :calories, :integer
  end
end
