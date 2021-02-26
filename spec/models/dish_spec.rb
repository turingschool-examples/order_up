require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end

  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :recipes}
    it {should have_many(:ingredients).through(:recipes)}
  end

  describe "Instance Methods" do
    describe "#calorie_count" do
      it "returns the total calories for a dish" do
        chef = Chef.create(name: "Chef")

        pizza = chef.dishes.create(name: "Pizza", description: "Even when its bad its good")

        cheese = Ingredient.create(name: "Cheese", calories: 150)
        dough = Ingredient.create(name: "Pizza Dough", calories: 200)
        sauce = Ingredient.create(name: "Pizza Sauce", calories: 50)

        pizza.ingredients << [dough, cheese, sauce]

        expect(pizza.calorie_count).to eq(400)
      end
    end
  end

  describe "Class Methods" do
    describe "::ingredients_list" do
      it "lists all of the ingredients in all the dishes" do
        chef = Chef.create(name: "Chef")

        pizza = chef.dishes.create(name: "Pizza", description: "Even when its bad its good")

        cheese = Ingredient.create(name: "Cheese", calories: 150)
        dough = Ingredient.create(name: "Pizza Dough", calories: 200)
        sauce = Ingredient.create(name: "Pizza Sauce", calories: 50)

        chicken = Ingredient.create(name: "Chicken", calories: 100)

        pizza.ingredients << [dough, cheese, sauce]

        expected = [cheese, dough, sauce]

        expect(Dish.ingredients_list).to eq(expected)
      end
    end
  end
end
