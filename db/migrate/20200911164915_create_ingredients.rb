class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.array :meat
      t.array :sauce
    end
  end
end
