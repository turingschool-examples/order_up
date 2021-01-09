require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :dish_ingredients}
    it {should have_many :ingredients}
  end

  describe "instance methods" do 
    it "calories" do 
      chef1 = Chef.create!(name: "mario")
      dish1 = Dish.create!(name: "pasta", description: "italian", chef: chef1)
      ingredient1 = Ingredient.create!(name: "tomatoes", calories: 10)
      ingredient2 = Ingredient.create!(name: "noddles", calories: 50)
      DishIngredient.create!(dish: dish1, ingredient: ingredient1)
      DishIngredient.create!(dish: dish1, ingredient: ingredient2)

      expect(dish1.calories).to eq(60)
    end
  end
end
