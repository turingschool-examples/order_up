class AddCalorieCountToDishes < ActiveRecord::Migration[5.2]
  def change
    add_column :dishes, :calorie_count, :integer
  end
end
