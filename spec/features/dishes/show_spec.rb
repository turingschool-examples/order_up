require 'rails_helper'

RSpec.describe 'When I visit a dish show page' do
  describe 'as a visitor' do
    it 'I see the dish name, description, ingredients, and chef name' do
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

      visit "/dishes/#{dish_1.id}"

      expect(page).to have_content(dish_1.name)
      expect(page).to have_content(dish_1.description)
      expect(page).to have_content(ingredient_1.name)
      expect(page).to have_content(dish_1.chef.name)
    end

    it 'I can see the total calorie count for that dish' do
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

      visit "/dishes/#{dish_1.id}"

      expect(page).to have_content('Total Calories: 650')
    end
  end
end
