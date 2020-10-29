require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it { should have_many :dish_ingredients }
    it { should have_many(:ingredients).through(:dish_ingredients) }
  end


  describe "instance methods" do
    it "#total_calories" do
      @chef = Chef.create!(name: "Chef")

      @ravioli = @chef.dishes.create!(name: "Ravioli", description: "Spinach Ravioli")

      @pasta = Ingredient.create!(name: "Pasta", quantity: 1, units: "cups", calories_per_unit: 100)
      @cheese = Ingredient.create!(name: "Cheese", quantity: 5, units: "cups", calories_per_unit: 500)
      @spinach = Ingredient.create!(name: "Spinach", quantity: 2, units: "cups", calories_per_unit: 50)

      @ravioli_ingredients = [@pasta, @cheese, @spinach]

      @ravioli.ingredients << @ravioli_ingredients

      expect(@ravioli.total_calories).to eq(2700)
    end
  end
end
