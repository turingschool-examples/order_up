require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end

  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :recipes}
    it {should have_many :ingredients}
  end

  describe "instance methods" do
    it "can calculate calories for a dish" do 
      chef = Chef.create(name: "Chef Von Winkle")
      dish = Dish.create(name: "pommes frites", description: "its delicious just eat it", chef: chef)
      ingredient1 = Ingredient.create(name: "pommes", calories: 300)
      ingredient2 = Ingredient.create(name: "frites", calories: 200)
      recipe1 = Recipe.create(dish: dish, ingredient: ingredient1)
      recipe2 = Recipe.create(dish: dish, ingredient: ingredient2)
      
      expect(dish.calories).to eq(500)
    end
  end
end
