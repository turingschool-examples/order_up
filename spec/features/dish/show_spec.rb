require 'rails_helper'

RSpec.describe 'dish show page' do
  describe 'As a visiter' do
    it 'has the dish name and desecription' do
      chef = Chef.create!(name: "Chef guy")
      pizza = Dish.create!(name: "pizza", description: "it is pizza...", ingredients: "sauce, cheese, jalapenos", calories: 400, chef_id: chef.id)
      visit "/dishes/#{pizza.id}"
      expect(page).to have_content(pizza.name)
      expect(page).to have_content("sauce")
      expect(page).to have_content("cheese")
      expect(page).to have_content("jalapenos")
      expect(page).to have_content(chef.name)
    end

    it 'has the dish calorie count' do
      chef = Chef.create!(name: "Chef guy")
      pizza = Dish.create!(name: "pizza", description: "it is pizza...", ingredients: "sauce, cheese, jalapenos", calories: 400, chef_id: chef.id)
      visit "/dishes/#{pizza.id}"
      expect(page).to have_content(400)
    end
  end
end
