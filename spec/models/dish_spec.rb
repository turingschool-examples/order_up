require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
  end

  describe "instance methods" do
    it "can count calories" do
      @chef = Chef.create!(name: "Bob")
      @curry = @chef.dishes.create!(name: "Curry", description: "Flavor!")
      @in1 = Ingredient.create!(name: "Flour", calories: 15)
      @in2 = Ingredient.create!(name: "egg", calories: 20)

      DishIngredient.create!(dish: @curry, ingredient: @in1, count: 2)
      DishIngredient.create!(dish: @curry, ingredient: @in2, count: 1)


      expect(@curry.total_calories).to eq(50)
    end
  end
end
