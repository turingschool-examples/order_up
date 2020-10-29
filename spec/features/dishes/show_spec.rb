require 'rails_helper'

RSpec.describe 'dish show page', type: :feature do
  describe "As a visitor on the dish show page" do
    it "I see the dish name, ingredients, description, and chefs name" do
      chef = Chef.create!(name: 'Ed')
      dish = Dish.create!(name: 'Soup', description: 'Nice and hearty', chef: chef)
      lentils = dish.ingredients.create!(name: 'Lentils', calories: 150)
      potatoes = dish.ingredients.create!(name: 'Potatoes', calories: 100)

      visit "dishes/#{dish.id}"

      expect(page).to have_content(dish.name)
      expect(page).to have_content(dish.description)

      within '.ingredients' do
        expect(page.all('li')[0]).to have_content(lentils.name)
        expect(page.all('li')[1]).to have_content(potatoes.name)
      end

      expect(page).to have_content(chef.name)
    end
  end
end
