require 'rails_helper'

RSpec.describe 'dishes/show', type: :feature do
  describe "when I visit a chef's show page" do
    it 'has chef information' do
      chef = Chef.create(name: 'Taylor Phillips')
      dish = Dish.create(name: 'Steak', description: 'Very good', chef_id: chef.id) 
      ingredient1 = Ingredient.create(name: 'Filet', calories: 950)
      ingredient2 = Ingredient.create(name: 'Butter', calories: 400)
      ingredient3 = Ingredient.create(name: 'Thyme', calories: 15)

      DishIngredient.create(dish_id: dish.id, ingredient_id: ingredient1.id)
      DishIngredient.create(dish_id: dish.id, ingredient_id: ingredient2.id)
      DishIngredient.create(dish_id: dish.id, ingredient_id: ingredient3.id)

      visit "/chefs/#{chef.id}"

      expect(page).to have_content(chef.name)

      click_link 'View All Ingredients'
      save_and_open_page
      expect(page).to have_current_path("chefs/#{chef.id}/ingredients")
      expect(page).to have_content(ingredient1.name)
      expect(page).to have_content(ingredient2.name)
      expect(page).to have_content(ingredient3.name)
    end
  end
end
