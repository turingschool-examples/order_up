class ChangeIngredientDescription < ActiveRecord::Migration[5.2]
  def change
    change_column :ingredients, :description, 'integer USING CAST(description AS integer)'
    rename_column :ingredients, :description, :calories
  end
end
