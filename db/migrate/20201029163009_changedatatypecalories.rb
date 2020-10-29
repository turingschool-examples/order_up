class Changedatatypecalories < ActiveRecord::Migration[5.2]
  def change
    remove_column :ingredients, :calories
    add_column :ingredients, :calories, :integer
  end
end
