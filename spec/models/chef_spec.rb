require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
  end

  describe "instance methods" do
    describe '#chefs_ingredients' do
      it "will return all the chef's current ingredients" do
        @chef = Chef.create!(name: "Gordan Ramsey")
        @dish = @chef.dishes.create!(name: "Burrito", description: "A simple bean and cheese burrito")
        @beans = Ingredient.create!(name: "Pinto Beans", calories: 150)
        @cheese = Ingredient.create!(name: "Sharp Chedder", calories: 175)
        DishIngredient.create!(dish: @dish, ingredient: @beans)
        DishIngredient.create!(dish: @dish, ingredient: @cheese)

        expect(@chef.chefs_ingredients.first.name).to eq("Pinto Beans")
        expect(@chef.chefs_ingredients.second.name).to eq("Sharp Chedder")
      end
    end
  end
end
