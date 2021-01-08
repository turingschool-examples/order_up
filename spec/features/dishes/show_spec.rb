require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  describe 'When I visit a dishes show page' do

    it 'I see the dishs name, description, ingredient list and chef' do

      boyardee = Chef.create!(name: 'le chef')
      meatball = Dish.create!(name: 'Meatball', description: 'Thats a soo spicy', chef_id: boyardee.id)
      beef = Ingredient.create!(name: 'beef', calories: 350)
      bread = Ingredient.create!(name: 'bread', calories: 100)
      sauce = Ingredient.create!(name: 'tomato paste', calories: 50)

      DishIngredient.create!(dish_id: meatball.id, ingredient_id: beef.id)
      DishIngredient.create!(dish_id: meatball.id, ingredient_id: bread.id)
      DishIngredient.create!(dish_id: meatball.id, ingredient_id: sauce.id)

      visit "/dishes/#{meatball.id}"
      

      expect(page).to have_content(meatball.name)
      expect(page).to have_content(meatball.description)
      expect(page).to have_content(beef.name)
      expect(page).to have_content(bread.name)
      expect(page).to have_content(sauce.name)
      expect(page).to have_content(boyardee.name)
    end
  end
end