require 'rails_helper'

RSpec.describe 'dish show page', type: :feature do
  describe 'as a visitor' do
    before(:each) do
      @chef = Chef.create!(name: "Claire Saffitz")
      @dish_1 = @chef.dishes.create!(name: "Soft & Crispy Focaccia", description: "Lots of olive oil.")
      @flour = @dish_1.ingredients.create!(name: "Flour", calories: 500)
      @yeast = @dish_1.ingredients.create!(name: "Yeast", calories: 0)
      @salt = @dish_1.ingredients.create!(name: "Salt", calories: 10)
      @evoo = @dish_1.ingredients.create!(name: "Olive Oil", calories: 250)
    end

    it 'i see the dish name, description, list of ingredients, and chefs name' do
      visit dish_path(@dish_1)
      save_and_open_page

      expect(page).to have_content(@dish_1.name)
      expect(page).to have_content(@dish_1.description)
      expect(page).to have_content(@chef.name)

      within("#dish-ingredients") do
        expect(page).to have_content(@flour.name)
        expect(page).to have_content(@yeast.name)
        expect(page).to have_content(@salt.name)
        expect(page).to have_content(@evoo.name)
        expect(page).to have_content(@dish_1.total_calories)
      end
    end
  end
end