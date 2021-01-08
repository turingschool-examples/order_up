class ChangeCalorieType < ActiveRecord::Migration[5.2]
  def change
    change_column :ingredients, :calories, 'integer USING CAST(calories AS integer)'
  end
end
