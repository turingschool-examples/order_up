
require 'rails_helper'

RSpec.describe 'When I visit a chef show page' do
  describe 'as a visitor' do
    it 'I see the chef name and link to all their used ingredients.' do
      chef_1 = Chef.create!(name: 'Chef Scott')
      ingredient_1 = Ingredient.create!(name: 'Peas', calories: '50')
      ingredient_2 = Ingredient.create!(name: 'Bacon', calories: '200')
      ingredient_3 = Ingredient.create!(name: 'Egg', calories: '100')
      ingredient_4 = Ingredient.create!(name: 'Spaghetti', calories: '300')
      dish_1 = chef_1.dishes.create!(name: 'Spaghetti Carbonara', description: 'Made with egg, bacon, and peas.')
      dish_2 = chef_1.dishes.create!(name: 'Eggs and Bacon', description: 'Simple protein breakfast.')
      Recipe.create!(ingredient: ingredient_1, dish: dish_1)
      Recipe.create!(ingredient: ingredient_2, dish: dish_1)
      Recipe.create!(ingredient: ingredient_3, dish: dish_1)
      Recipe.create!(ingredient: ingredient_4, dish: dish_1)
      Recipe.create!(ingredient: ingredient_2, dish: dish_2)
      Recipe.create!(ingredient: ingredient_3, dish: dish_2)

      visit "/chefs/#{chef_1.id}"
      expect(page).to have_content(chef_1.name)
      expect(page).to have_link('All Ingredients')

    end

    it 'When I click the chef ingredient link I am taken to that chefs ingredient index page with all ingredients.' do
      chef_1 = Chef.create!(name: 'Chef Scott')
      ingredient_1 = Ingredient.create!(name: 'Peas', calories: '50')
      ingredient_2 = Ingredient.create!(name: 'Bacon', calories: '200')
      ingredient_3 = Ingredient.create!(name: 'Egg', calories: '100')
      ingredient_4 = Ingredient.create!(name: 'Spaghetti', calories: '300')
      dish_1 = chef_1.dishes.create!(name: 'Spaghetti Carbonara', description: 'Made with egg, bacon, and peas.')
      dish_2 = chef_1.dishes.create!(name: 'Eggs and Bacon', description: 'Simple protein breakfast.')
      Recipe.create!(ingredient: ingredient_1, dish: dish_1)
      Recipe.create!(ingredient: ingredient_2, dish: dish_1)
      Recipe.create!(ingredient: ingredient_3, dish: dish_1)
      Recipe.create!(ingredient: ingredient_4, dish: dish_1)
      Recipe.create!(ingredient: ingredient_2, dish: dish_2)
      Recipe.create!(ingredient: ingredient_3, dish: dish_2)

      visit "/chefs/#{chef_1.id}"
      click_link('All Ingredients')
      expect(current_path).to eq("/chefs/#{chef_1.id}/ingredients")
      expect(page).to have_content(ingredient_1.name)
      expect(page).to have_content(ingredient_2.name)
      expect(page).to have_content(ingredient_3.name)
      expect(page).to have_content(ingredient_4.name)
save_and_open_page
    end
  end
end
