require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  describe 'When I visit a dishs show page' do
    before(:each) do
      # Chefs: 
      @chef1     = Chef.create!(name: "Henry Dapasta")
      @chef2     = Chef.create!(name: "Molly LaBaker")
      # Dishes:
      @dish1     = Dish.create!(name: 'Sphaghetti', description: 'Sphaghetti noodles with red marinara meat sauce', chef_id: @chef1.id)
      @dish2     = Dish.create!(name: 'Apple Cake', description: 'German Apfel Torte with creme anglaise', chef_id: @chef2.id)
      # Ingredients:
      @apple     = Ingredient.create!(name:'Apple', calories: 35)
      @noodle    = Ingredient.create!(name:'Spaghetti Noodle', calories: 135)
      @sauce     = Ingredient.create!(name:'Sauce', calories: 200)
      @pie_crust = Ingredient.create!(name:'Pie Crust', calories: 150)
      # Dish Ingredients:
      @apple_pie1 = DishIngredient.create!(dish_id: @dish2.id, ingredient_id: @apple.id)
      @apple_pie2 = DishIngredient.create!(dish_id: @dish2.id, ingredient_id: @pie_crust.id)
      @spaghetti1 = DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @noodle.id)
      @spaghetti2 = DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @sauce.id)
    end
    # User Story 1
    it 'I see the dishs name and description' do
      visit dish_path(@dish1.id)

      expect(page).to have_content(@dish1.name)
      expect(page).to have_content(@dish1.description)
    end
    # User Story 2
    it 'I see the total calorie count for that dish' do
      visit dish_path(@dish1.id)

      expect(page).to have_content("Total Calories: #{@dish1.total_calories}")
    end
  end
end