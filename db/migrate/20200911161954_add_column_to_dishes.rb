class AddColumnToDishes < ActiveRecord::Migration[5.2]
  def change
    add_column :dishes, :total_calories, :integer
  end
end
