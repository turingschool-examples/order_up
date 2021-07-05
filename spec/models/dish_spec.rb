require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :ingredients_dish}
    it {should have_many(:ingredients).through(:ingredients_dish)}
  end

  describe "actions" do
    it 'can calculate total calories' do
      chef = Chef.create!(name: "Ratatouille")
      dish1 = chef.dishes.create!(name: "Pasta", description: "Angel hair noodles")
      dish2 = chef.dishes.create!(name: "Garlic Bread", description: "French bread with garlic and butter")
      ingredient1 = Ingredient.create!(name: "Noodles", calories: 400)
      ingredient2 = Ingredient.create!(name: "Butter", calories: 100)
      ingredient3 = Ingredient.create!(name: "Bread", calories: 200)
      ingredient4 = Ingredient.create!(name: "Garlic", calories: 50)
      IngredientsDish.create!(ingredient_id: ingredient1.id, dish_id: dish1.id)
      IngredientsDish.create!(ingredient_id: ingredient2.id, dish_id: dish1.id)
      IngredientsDish.create!(ingredient_id: ingredient3.id, dish_id: dish2.id)
      IngredientsDish.create!(ingredient_id: ingredient4.id, dish_id: dish2.id)

      expect(dish1.total_calories).to eq(500)
      expect(dish2.total_calories).to eq(250)
    end
  end
end
