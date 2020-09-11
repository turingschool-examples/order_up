require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :dish_ingredients}
    it {should have_many(:ingredients).through(:dish_ingredients)}
  end

  it 'can sum calories of all ingredients' do
    chef = Chef.create!(name: 'Elzar')
    dish = chef.dishes.create!(name: 'Spice Cake', description: 'A tasty but spicy cake')
    dish.ingredients.create!(name: 'cake', calories: 390)
    dish.ingredients.create!(name: 'spice wezeal', calories: 5)
    expect(dish.total_calories).to eq(Ingredient.sum(:calories))
  end

  it 'can list uniqe ingredints' do
    chef = Chef.create!(name: 'Elzar')
    dish_1 = chef.dishes.create!(name: 'Spice Cake', description: 'A tasty but spicy cake')
    ing_1 = dish_1.ingredients.create!(name: 'cake', calories: 390)
    ing_2 = dish_1.ingredients.create!(name: 'spice wezeal', calories: 5)

    dish_2 = chef.dishes.create!(name: 'Grilled Chicken', description: 'Everything is better grilled, even chicken.')
    ing_3 = dish_2.ingredients.create!(name: 'chicken', calories: 200)
    dish_2.ingredients << ing_2

    expected = [ing_1, ing_2, ing_3]
    expect(Dish.unique_ingredients).to eq(expected)
  end
end
