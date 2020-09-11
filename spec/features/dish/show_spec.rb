require 'rails_helper'

RSpec.describe 'dish show page' do
  describe 'As a visiter' do
    it 'has the dish name and desecription' do
      pizza = Dish.create!(name: "pizza", description: "it is pizza...", ingredients: ["sauce", "cheese", "jalapenos"])

      visit "/dish/#{pizza.id}"
      expect(page).to have_content(pizza.name)
      expect(page).to have_content("sauce")
      expect(page).to have_content("cheese")
      expect(page).to have_content("jalapenos")

    end
  end
end
