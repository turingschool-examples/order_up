require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end

  describe "relationships" do
    it {should have_many :dishes}
  end

  describe "instance methods" do
    it "can find all of a chefs used ingredients" do
      chef1 = Chef.create(name: "Gordon Ramsay")
      dish1 = chef1.dishes.create(name: "Beef Wellington", description: "Amazing")
      ingredient1 = Ingredient.create(name: "Beef", calories: 100)
      ingredient5 = Ingredient.create(name: "Bread Crumbs", calories: 35)
      DishIngredient.create(dish: dish1, ingredient: ingredient5)
      DishIngredient.create(dish: dish1, ingredient: ingredient1)

      expect(chef1.ingredients).to eq([ingredient5, ingredient1])
    end
    it "can find the three most popular ingredients" do
      chef1 = Chef.create(name: "Gordon Ramsay")
      dish1 = chef1.dishes.create(name: "Beef Wellington", description: "Amazing")
      dish2 = chef1.dishes.create(name: "Fish and Chips", description: "Oh yeah")
      dish3 = chef1.dishes.create(name: "Test Meal", description: "For popularity")
      dish4 = chef1.dishes.create(name: "Test Meal 2", description: "For popularity")
      ingredient1 = Ingredient.create(name: "Beef", calories: 100)
      ingredient3 = Ingredient.create(name: "Fish", calories: 50)
      ingredient4 = Ingredient.create(name: "Fries", calories: 350)
      ingredient5 = Ingredient.create(name: "Bread Crumbs", calories: 35)
      DishIngredient.create(dish: dish1, ingredient: ingredient3)
      DishIngredient.create(dish: dish2, ingredient: ingredient3)
      DishIngredient.create(dish: dish3, ingredient: ingredient3)
      DishIngredient.create(dish: dish4, ingredient: ingredient3)
      DishIngredient.create(dish: dish1, ingredient: ingredient5)
      DishIngredient.create(dish: dish2, ingredient: ingredient5)
      DishIngredient.create(dish: dish3, ingredient: ingredient5)
      DishIngredient.create(dish: dish1, ingredient: ingredient1)
      DishIngredient.create(dish: dish2, ingredient: ingredient1)
      DishIngredient.create(dish: dish1, ingredient: ingredient4)

      expect(chef1.most_popular_ingredients).to eq([ingredient3, ingredient5, ingredient1])
      expect(chef1.most_popular_ingredients).to_not eq([ingredient5, ingredient3, ingredient1])
    end
  end
end
