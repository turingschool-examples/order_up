require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  describe 'When I visit a chefs show page' do
   
    it 'I see the name of that chef, a link to view all ingredients they use, when I click that link I am taken to the chefs ingredient index and I see a unique list of those ingredients' do
      boyardee = Chef.create!(name: 'le chef')
      meatball = Dish.create!(name: 'Meatball', description: 'Thats a soo spicy', chef_id: boyardee.id)
      hero = meatball = Dish.create!(name: 'Hero', description: 'We dont all wear capes', chef_id: boyardee.id)
      beef = Ingredient.create!(name: 'beef', calories: 350)
      bread = Ingredient.create!(name: 'bread', calories: 100)
      sauce = Ingredient.create!(name: 'tomato paste', calories: 50)
      lettuce = Ingredient.create!(name: 'crispy lettuce', calories: 30)

      DishIngredient.create!(dish_id: meatball.id, ingredient_id: beef.id)
      DishIngredient.create!(dish_id: meatball.id, ingredient_id: bread.id)
      DishIngredient.create!(dish_id: meatball.id, ingredient_id: sauce.id)
      DishIngredient.create!(dish_id: hero.id, ingredient_id: beef.id)
      DishIngredient.create!(dish_id: hero.id, ingredient_id: bread.id)
      DishIngredient.create!(dish_id: hero.id, ingredient_id: lettuce.id)

      visit "chefs/#{boyardee.id}"

      expect(page).to have_content(boyardee.name)
      expect(page).to have_link("Ingredients")
      
      click_on "Ingredients"

      expect(current_path).to eq("chefs/#{boyardee.id}/ingredients")
      expect(page).to have_content(beef.name)
      expect(page).to have_content(bread.name)
      expect(page).to have_content(sauce.name)
      expect(page).to have_content(lettuce.name)

    end
  end
end