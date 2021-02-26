require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end

  describe "relationships" do
    it {should have_many :dishes}
  end

  describe "instance methods" do
    describe "#chefs_ingredients" do
      it "shows a chef's ingredients" do
        chef_1 = Chef.create!(name: "Chef")
        dish_1 = Dish.create!(name: "Pizza", description: "Tasty", chef_id: chef_1.id )
        dish_2 = Dish.create!(name: "Toast", description: "Yummy", chef_id: chef_1.id )
        ingred_1 = Ingredient.create!(name: "Cheese", calories: 450)
        ingred_2 = Ingredient.create!(name: "Dough", calories: 300)
        ingred_3 = Ingredient.create!(name: "Marinara", calories: 100)
        ingred_4 = Ingredient.create!(name: "Bread", calories: 100)
        ingred_5 = Ingredient.create!(name: "Butter", calories: 200)
        dish_1_ingred_1 = DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingred_1.id)
        dish_1_ingred_2 = DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingred_2.id)
        dish_1_ingred_3 = DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingred_3.id)
        dish_2_ingred_4 = DishIngredient.create!(dish_id: dish_2.id, ingredient_id: ingred_4.id)
        dish_2_ingred_5 = DishIngredient.create!(dish_id: dish_2.id, ingredient_id: ingred_5.id)

        expected = chef_1.chefs_ingredients

        expect(expected).to eq(["Cheese", "Dough", "Marinara", "Bread", "Butter"])
      end
    end
  end
end
