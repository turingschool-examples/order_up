require 'rails_helper'

describe 'As a visitor' do
  describe 'When I visit a dishes show page' do
    it 'should see the dishes name, description, list of ingredients, and chef name' do
      chef = Chef.create!(name: 'Gordon Ramsey')
      dish = chef.dishes.create!(name: 'Chicken Mac n Cheese', description: 'One of the finest meals.')
      ingredient1 = Ingredient.create!(name: 'Cheese', calories: 200)
      ingredient2 = Ingredient.create!(name: 'Chicken', calories: 450)
      ingredient3 = Ingredient.create!(name: 'Pasta', calories: 300)
      Meal.create!(dish_id: dish.id, ingredient_id: ingredient1.id)
      Meal.create!(dish_id: dish.id, ingredient_id: ingredient2.id)
      Meal.create!(dish_id: dish.id, ingredient_id: ingredient3.id)

      visit "/dishes/#{dish.id}"

      expect(page).to have_content(dish.name)
      expect(page).to have_content(dish.description)
      expect(page).to have_content('Ingredients:')
      expect(page).to have_content(ingredient1.name)
      expect(page).to have_content(ingredient2.name)
      expect(page).to have_content(ingredient3.name)

      expect(page).to have_content("Chef: #{chef.name}")
      save_and_open_page
    end
  end
end