require 'rails_helper'

describe 'As a visitor' do
  describe 'When I visit a chefs show page' do
    it 'should see chef name, link to view a list of all ingredients.' do
      chef = Chef.create!(name: 'Gordon Ramsey')
      dish1 = chef.dishes.create!(name: 'Chicken Mac n Cheese', description: 'One of the finest meals.')
      dish2 = chef.dishes.create!(name: 'Chicken Roast', description: 'Exquisit')
      ingredient1 = chef.ingredients.create!(name: 'Cheese', calories: 200)
      ingredient2 = chef.ingredients.create!(name: 'Chicken', calories: 450)
      ingredient3 = chef.ingredients.create!(name: 'Pasta', calories: 300)
      ingredient4 = chef.ingredients.create!(name: 'Salt', calories: 50)
      ingredient5 = chef.ingredients.create!(name: 'lemon', calories: 100)
      Meal.create!(dish_id: dish1.id, ingredient_id: ingredient1.id)
      Meal.create!(dish_id: dish1.id, ingredient_id: ingredient2.id)
      Meal.create!(dish_id: dish1.id, ingredient_id: ingredient3.id)
      Meal.create!(dish_id: dish2.id, ingredient_id: ingredient3.id)
      Meal.create!(dish_id: dish2.id, ingredient_id: ingredient4.id)
      Meal.create!(dish_id: dish2.id, ingredient_id: ingredient5.id)

      visit "/chefs/#{chef.id}"

      expect(page).to have_content(chef.name)
      expect(page).to have_link('All Ingredients')

      click_link 'All Ingredients'
      expect(current_path).to eq("/chefs/#{chef.id}/ingredients")
      expect(page).to have_content(ingredient1.name)
      expect(page).to have_content(ingredient2.name)
      expect(page).to have_content(ingredient3.name)
      expect(page).to have_content(ingredient4.name)
      expect(page).to have_content(ingredient5.name)
    end
  end
end