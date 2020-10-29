# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe "When I visit a chef's show page" do
    describe 'I see the name of that chef' do
      it 'And I see a link to view a list of all ingredients that this chef uses in their dishes' do
        chef = Chef.create!(name: 'Cheif')

        mac = Ingredient.create!(name: 'mac', calories: 200)
        cheese = Ingredient.create!(name: 'cheese', calories: 200)

        dish = Dish.create!(name: 'mac and cheese', description: 'cheesy', chef_id: chef.id)

        DishIngredient.create!(dish_id: dish.id, ingredient_id: mac.id)
        DishIngredient.create!(dish_id: dish.id, ingredient_id: cheese.id)

        visit "/chefs/#{chef.id}"

        expect(page).to have_content(chef.name)
        expect(page).to have_link("All Ingredients")
      end
      describe 'When I click on that link' do
        describe "I'm taken to a chef's ingredient index page" do
          it 'and I can see a unique list of names of all the ingredients that this chef uses' do
            chef = Chef.create!(name: 'Cheif')

            mac = Ingredient.create!(name: 'mac', calories: 200)
            cheese = Ingredient.create!(name: 'cheese', calories: 200)

            dish = Dish.create!(name: 'mac and cheese', description: 'cheesy', chef_id: chef.id)

            DishIngredient.create!(dish_id: dish.id, ingredient_id: mac.id)
            DishIngredient.create!(dish_id: dish.id, ingredient_id: cheese.id)

            visit "/chefs/#{chef.id}"

            click_on "All Ingredients"

            expect(page).to have_content(mac.name)
            expect(page).to have_content(cheese.name)
          end
        end
      end
    end
  end
end
