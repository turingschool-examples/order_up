# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe "When I visit a dish's show page" do
    describe 'I see the dish’s name and description' do
      it "And I see a list of ingredients for that dish And I see the chef's name" do
        chef = Chef.create!(name: 'Cheif')

        mac = Ingredient.create!(name: 'mac', calories: 200)
        cheese = Ingredient.create!(name: 'cheese', calories: 200)

        dish = Dish.create!(name: 'mac and cheese', description: 'cheesy', chef_id: chef.id)

        DishIngredient.create!(dish_id: dish.id, ingredient_id: mac.id)
        DishIngredient.create!(dish_id: dish.id, ingredient_id: cheese.id)

        visit "dishes/#{dish.id}"

        expect(page).to have_content(dish.name)
        expect(page).to have_content(dish.description)
        expect(page).to have_content(mac.name)
        expect(page).to have_content(cheese.name)
        expect(page).to have_content(chef.name)
      end
    end
    it 'I see the total calorie count for that dish.' do
      chef = Chef.create!(name: 'Cheif')

      mac = Ingredient.create!(name: 'mac', calories: 200)
      cheese = Ingredient.create!(name: 'cheese', calories: 200)

      dish = Dish.create!(name: 'mac and cheese', description: 'cheesy', chef_id: chef.id)

      DishIngredient.create!(dish_id: dish.id, ingredient_id: mac.id)
      DishIngredient.create!(dish_id: dish.id, ingredient_id: cheese.id)

      visit "dishes/#{dish.id}"

      expect(page).to have_content(400)
    end
  end
end
