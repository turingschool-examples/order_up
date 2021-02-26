require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end

  describe "relationships" do
    it {should belong_to :chef}
    it { should have_many :dish_ingredients }
    it { should have_many(:ingredients).through(:dish_ingredients)}
  end

  describe "instance methods" do
    describe "#dish_information" do
      it "shows a dish's ingredients" do
        chef_1 = Chef.create!(name: "Chef")
        dish_1 = Dish.create!(name: "Pizza", description: "Tasty", chef_id: chef_1.id )
        ingred_1 = Ingredient.create!(name: "Cheese", calories: 450)
        ingred_2 = Ingredient.create!(name: "Dough", calories: 300)
        ingred_3 = Ingredient.create!(name: "Marinara", calories: 100)
        dish_1_ingred_1 = DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingred_1.id)
        dish_1_ingred_2 = DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingred_2.id)
        dish_1_ingred_3 = DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingred_3.id)

        expected = dish_1.dish_information.map do |ingred|
                    ingred.name
                  end

        expect(expected).to eq(["Cheese", "Dough", "Marinara"])
      end
    end
  end

  describe "#calorie_calculation" do
    it "calculates the total calories in a dish" do
      chef_1 = Chef.create!(name: "Chef")
      dish_1 = Dish.create!(name: "Pizza", description: "Tasty", chef_id: chef_1.id )
      ingred_1 = Ingredient.create!(name: "Cheese", calories: 450)
      ingred_2 = Ingredient.create!(name: "Dough", calories: 300)
      ingred_3 = Ingredient.create!(name: "Marinara", calories: 100)
      dish_1_ingred_1 = DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingred_1.id)
      dish_1_ingred_2 = DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingred_2.id)
      dish_1_ingred_3 = DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingred_3.id)

      expect(dish_1.calorie_calculation).to eq(850)
    end
  end

  describe "#chef_information" do
    it "shows chef's name" do
      chef_1 = Chef.create!(name: "Chef")
      dish_1 = Dish.create!(name: "Pizza", description: "Tasty", chef_id: chef_1.id )

      expect(dish_1.chef_information).to eq("Chef")
    end
  end
end
