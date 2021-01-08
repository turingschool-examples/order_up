require 'rails_helper'

RSpec.describe 'ingredients index page', type: :feature do
  describe 'as a visitor' do
    before(:each) do
      @chef = Chef.create!(name: "Claire Saffitz")
      @dish_1 = @chef.dishes.create!(name: "Soft & Crispy Focaccia", description: "Lots of olive oil.")
      @flour = @dish_1.ingredients.create!(name: "Flour", calories: 500)
      @yeast = @dish_1.ingredients.create!(name: "Yeast", calories: 0)
      @salt = @dish_1.ingredients.create!(name: "Salt", calories: 10)
      @evoo = @dish_1.ingredients.create!(name: "Olive Oil", calories: 250)
    end

    it 'when i visit a chefs ingredients index page i see the list of ingredients they use' do
      visit chef_ingredients_path(@chef)
      
      expect(page).to have_content("Used by Chef #{@chef.name}")
      expect(page).to have_content(@flour.name)
      expect(page).to have_content(@yeast.name)
      expect(page).to have_content(@salt.name)
      expect(page).to have_content(@evoo.name)
    end
  end
end