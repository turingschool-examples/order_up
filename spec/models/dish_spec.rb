require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
  end

  describe "model methods" do
    it "calculates the total calories" do

      chef_1 = Chef.create!(name: "Dan")
      dish_1 = chef_1.dishes.create!(name: "A Dish", description: "A Description")
      ingredient_1 = Ingredient.create!(name: "A Ingredient", calories: 100)
      ingredient_2 = Ingredient.create!(name: "B Ingredient", calories: 300)
      ingredient_3 = Ingredient.create!(name: "C Ingredient", calories: 400)
      DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingredient_1.id)
      DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingredient_2.id)

      expect(dish_1.total_calories).to eq(400)
    end
  end
end
