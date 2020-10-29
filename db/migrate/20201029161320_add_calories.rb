class AddCalories < ActiveRecord::Migration[5.2]
  def change
    add_column :ingredients, :calories, :string
  end
end
