require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end

  describe "relationships" do
    it {should have_many :dishes}
    it {should have_many(:ingredients).through(:dishes)}
  end

  describe "instance methods" do
    before (:each) do
      @chef = Chef.create!(name: 'Ed')

      @lentils = Ingredient.create!(name: 'Lentils', calories: 150)
      @potatoes = Ingredient.create!(name: 'Potatoes', calories: 100)
      @bun = Ingredient.create!(name: 'Bun', calories: 50)
      @patty = Ingredient.create!(name: 'Veggie Patty', calories: 100)
      @tomato = Ingredient.create!(name: 'Tomato', calories: 10)

      @soup = Dish.create!(name: 'Soup', description: 'Nice and hearty', chef: @chef)
      @soup.ingredients << @lentils
      @soup.ingredients << @potatoes

      @veggie_burger = Dish.create!(name: 'Veggie Burger', description: 'Also nice and hearty', chef: @chef)
      @veggie_burger.ingredients << @bun
      @veggie_burger.ingredients << @patty
      @veggie_burger.ingredients << @tomato
      @veggie_burger.ingredients << @potatoes

      @dal = Dish.create!(name: 'Dal', description: 'Warm and hearty', chef: @chef)
      @dal.ingredients << @lentils
      @dal.ingredients << @potatoes
      @dal.ingredients << @tomato
    end

    it "#unique_ingredients" do
      expect(@chef.unique_ingredients).to eq([@lentils, @potatoes, @bun, @patty, @tomato])
    end
  end
end
