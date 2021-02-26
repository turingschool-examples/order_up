require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe "relationships" do
    it {should have_many :dish_ingredients}
    it {should have_many(:dishes).through(:dish_ingredients)}
  end
  describe "class methos" do
    describe "::chef_unique_ingredients" do
      it "return a list of unique ingredients for that chef" do
        @chef1 = Chef.create!(name: "Peter")
        @dish1 = @chef1.dishes.create!(name: "Mac n Cheese", description: "Delicious!, but high in calories")
        @ingredient1 = @dish1.ingredients.create!(name: "Elbow Pasta", calories: 80)
        @ingredient2 = @dish1.ingredients.create!(name: "Cheese", calories: 180)
        @ingredient3 = @dish1.ingredients.create!(name: "Butter", calories: 150)
        @dish2 = @chef1.dishes.create!(name: "Cheese Pizza", description: "Best Pizza in town")
        @ingredient4 = @dish2.ingredients.create!(name: "Dough", calories: 120)
        @ingredient5 = @dish2.ingredients.create!(name: "Cheese", calories: 160)
        @ingredient6 = @dish2.ingredients.create!(name: "Pizza Sauce", calories: 100)

        expect(@chef1.chef_unique_ingredients).to eq(["Butter", "Cheese", "Dough", "Elbow Pasta", "Pizza Sauce"])
      end
    end
  end
end
