require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
  end

  describe "Instnace Methods" do
    describe "#ingredient_list" do
      it "returns a list of the chef's dish's ingredients" do
        chef = Chef.create(name: "Chef")

        mac_cheese = chef.dishes.create(name: "Mac and Cheese", description: "Cheesy Goodness")
        pizza = chef.dishes.create(name: "Pizza", description: "Even when its bad its good")
    
        mac = Ingredient.create(name: "Mac", calories: 100)
        cheese = Ingredient.create(name: "Cheese", calories: 150)
        dough = Ingredient.create(name: "Pizza Dough", calories: 200)
        sauce = Ingredient.create(name: "Pizza Sauce", calories: 50)
    
        chicken = Ingredient.create(name: "Chicken", calories: 100)
    
        mac_cheese.ingredients << [mac, cheese]
        pizza.ingredients << [dough, cheese, sauce]

        expected = [mac, cheese, dough, sauce]
        expect(chef.ingredients_list).to eq(expected)
      end
    end
  end
end
