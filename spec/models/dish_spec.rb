require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
  end
  describe "Instance Methods" do
    before :each do
      @beef = Ingredient.create(name: "Beef", calories: 200)
      @flour = Ingredient.create(name: "Flour", calories: 25)
      @egg = Ingredient.create(name: "Egg", calories: 8)

      @chef = Chef.create(name: "Boirdee")
      @dish = @chef.dishes.create(name: "Speghetti and meatballs", description: "An Italian Classic")

      Recipe.create(ingredient_id: @beef.id, dish_id: @dish.id)
      Recipe.create(ingredient_id: @flour.id, dish_id: @dish.id)
      Recipe.create(ingredient_id: @egg.id, dish_id: @dish.id)
    end
    it "total_calories" do
      expect(@dish.total_calories).to eq(233)
    end
  end
end
