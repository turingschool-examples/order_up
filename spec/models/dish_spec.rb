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

  describe "Model methods" do
    it "should return the total calories for that dish" do
      gordon = Chef.create({name: "Gordon Ramsey"})
      burger = Dish.create({name: "Cheese Burger", description: "Famous Burger", chef_id: gordon.id})
      buns = Ingredient.create({name: "Buns", calories: 60})
      patty = Ingredient.create({name: 'Patty', calories: 120})
      tomato = Ingredient.create({name: 'Tomato', calories: 30})
      onion = Ingredient.create({name: 'Onion', calories: 20})
      DishIngredient.create({dish_id: burger.id, ingredient_id: buns.id})
      DishIngredient.create({dish_id: burger.id, ingredient_id: patty.id})
      DishIngredient.create({dish_id: burger.id, ingredient_id: tomato.id})
      DishIngredient.create({dish_id: burger.id, ingredient_id: onion.id})

      expect(burger.total_calories).to eq(230)
    end
  end
end
