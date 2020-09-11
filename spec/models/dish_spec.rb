require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many(:ingredients).through(:dish_ingredients)}
  end

  describe "instance method" do
    it "#calorie_count" do
      chef_2 = Chef.create!(name: "Amma")
      dish_2 = Dish.create!(name: "Omelet", description: "Egg white omelet with goat cheese and sliced cherry tomatoes", chef_id: chef_2.id)
      ingredient_4 = Ingredient.create!(name: "egg whites", calories: "110")
      ingredient_5 = Ingredient.create!(name: "goat cheese", calories: "193")
      ingredient_6 = Ingredient.create!(name: "cherry tomatoes", calories: "23")
      DishIngredient.create!(ingredient_id: ingredient_4.id, dish_id: dish_2.id)
      DishIngredient.create!(ingredient_id: ingredient_5.id, dish_id: dish_2.id)
      DishIngredient.create!(ingredient_id: ingredient_6.id, dish_id: dish_2.id)

      expect(dish_2.calorie_count).to eq(326)
    end
  end
end
