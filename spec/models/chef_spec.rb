require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
  end

  describe "actions" do
    it 'can calculate most popular ingredients' do
      chef = Chef.create!(name: "Ratatouille")
      dish1 = chef.dishes.create!(name: "Pasta", description: "Angel hair noodles")
      dish2 = chef.dishes.create!(name: "Garlic Bread", description: "French bread with garlic and butter")
      ingredient1 = Ingredient.create!(name: "Noodles", calories: 400)
      ingredient2 = Ingredient.create!(name: "Butter", calories: 100)
      ingredient3 = Ingredient.create!(name: "Bread", calories: 200)
      ingredient4 = Ingredient.create!(name: "Garlic", calories: 50)
      ingredient5 = Ingredient.create!(name: "Chocolate", calories: 200)
      IngredientsDish.create!(ingredient_id: ingredient1.id, dish_id: dish1.id)
      IngredientsDish.create!(ingredient_id: ingredient2.id, dish_id: dish1.id)
      IngredientsDish.create!(ingredient_id: ingredient3.id, dish_id: dish2.id)
      IngredientsDish.create!(ingredient_id: ingredient4.id, dish_id: dish2.id)

      #expect(chef.popular_ingredients).to eq(["Butter, Noodles, Bread"])
    end

  end
end
