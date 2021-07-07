require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
  end

  describe "methods" do
    before :each do
      @chef = Chef.create(name: "Chef Boyardee")
      @ravioli = @chef.dishes.create(name: "Ravioli", description: "I mean it's Chef Boyardee")

      @pasta = Ingredient.create(name: "Pasta", quantity: 2, units: "cups", calories_per_unit: 120)
      @sausage = Ingredient.create(name: "Sausage", quantity: 4, units: "cups", calories_per_unit: 320)
      @sauce = Ingredient.create(name: "Sauce", quantity: 5, units: "cups", calories_per_unit: 200)

      @ravioli_ingredients = [@pasta, @sausage, @sauce]
      @ravioli.ingredients << @ravioli_ingredients
    end

    it ".total_calories" do
      expect(@ravioli.total_calories).to eq(2520)
    end
  end
end
