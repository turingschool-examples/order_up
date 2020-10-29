require 'rails_helper'

RSpec.describe 'dishes/show', type: :feature do
  describe "when I visit a dish's show page" do
    it 'has dish information' do
      chef = Chef.create(name: 'Taylor Phillips')
      dish = Dish.create(name: 'Steak', description: 'Very good', chef_id: chef.id) 
      ingredient1 = Ingredient.create(name: 'Filet', calories: 950)
      ingredient2 = Ingredient.create(name: 'Butter', calories: 400)
      ingredient3 = Ingredient.create(name: 'Thyme', calories: 15)

      DishIngredient.create(dish_id: dish.id, ingredient_id: ingredient1.id)
      DishIngredient.create(dish_id: dish.id, ingredient_id: ingredient2.id)
      DishIngredient.create(dish_id: dish.id, ingredient_id: ingredient3.id)

      visit "/dishes/#{chef.id}"

      expect(page).to have_content(dish.name)
      expect(page).to have_content(dish.description)
      expect(page).to have_content(ingredient1.name)
      expect(page).to have_content(ingredient2.name)
      expect(page).to have_content(ingredient3.name)
      expect(page).to have_content(chef.name)
    end
  end
end
