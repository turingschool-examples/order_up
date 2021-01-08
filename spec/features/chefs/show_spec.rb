require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  describe 'When I visit a chefs show page' do
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
    # User Story 3
    it 'I see the chefs name, & link to chefs ingredient index page where I see all ingredients used in dishes' do
      visit chef_path(@chef1.id)

      expect(page).to have_content(@chef1.name)
      expect(page).to have_link('Ingredients Used')

      click_link('Ingredients Used')

      expect(current_path).to eq(chef_ingredients_path(@chef1.id))
      expect(page).to have_content("Ingredient Name: #{@noodle.name}")
      expect(page).to have_content("Ingredient Name: #{@sauce.name}")
      save_and_open_page
    end
  end
end