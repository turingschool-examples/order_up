require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
  end

  describe 'instance methods' do
    it "#calorie_count" do
    chef_1 = Chef.create!(name: "Master Chef Tingo")
    dish_1 = chef_1.dishes.create!(name: "Shrimp Fried Rice", description: "Hails from the great hills of Japan.")
    ingredient_1 = Ingredient.create!(name: "Black Dragon Rice", calories: 100)
    ingredient_2 = Ingredient.create!(name: "Sweet Orange Nectar from the Killer Bee", calories: 1000)
    dish_1.ingredients << ingredient_1
    dish_1.ingredients << ingredient_2
    chef_1.dishes << dish_1
    expect(dish_1.calorie_count).to eq(1100)
  end
end
end
