require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
  end

  describe "instance methods" do
    it "#ingredients" do
      @chef = Chef.create!(name: "Chef")

      @ravioli = @chef.dishes.create!(name: "Ravioli", description: "Spinach Ravioli")
      @pasta = Ingredient.create!(name: "Pasta", quantity: 1, units: "cups", calories_per_unit: 100)
      @cheese = Ingredient.create!(name: "Cheese", quantity: 5, units: "cups", calories_per_unit: 500)
      @spinach = Ingredient.create!(name: "Spinach", quantity: 2, units: "cups", calories_per_unit: 50)
      @ravioli_ingredients = [@pasta, @cheese, @spinach]
      @ravioli.ingredients << @ravioli_ingredients

      @coffee = @chef.dishes.create!(name: "Coffee", description: "Hot")
      @water = Ingredient.create!(name: "Water", quantity:1, units: "cups", calories_per_unit: 0)
      @coffe_bean = Ingredient.create!(name: "Folgers", quantity:1, units: "cups", calories_per_unit: 100)
      @coffee_ingredients = [@water, @coffe_bean]
      @coffee.ingredients << @coffee_ingredients

      expect(@chef.ingredients).to eq(["Cheese", "Folgers", "Pasta", "Spinach", "Water"])
    end
  end
end
