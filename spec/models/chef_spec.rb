require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
  end

  describe "model methods" do
    it "creates a unique list of ingredient names" do

      chef_1 = Chef.create!(name: "Dan")
      dish_1 = chef_1.dishes.create!(name: "A Dish", description: "A Description")
      dish_2 = chef_1.dishes.create!(name: "B Dish", description: "B Description")
      ingredient_1 = Ingredient.create!(name: "A Ingredient", calories: 100)
      ingredient_2 = Ingredient.create!(name: "B Ingredient", calories: 300)
      ingredient_3 = Ingredient.create!(name: "C Ingredient", calories: 400)
      ingredient_4 = Ingredient.create!(name: "D Ingredient", calories: 200)
      DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingredient_1.id)
      DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingredient_2.id)
      DishIngredient.create!(dish_id: dish_2.id, ingredient_id: ingredient_1.id)
      DishIngredient.create!(dish_id: dish_2.id, ingredient_id: ingredient_3.id)

      expect(chef_1.unique_names).to eq("A Ingredient, B Ingredient, C Ingredient")
    end
  end
end
