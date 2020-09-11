require 'rails_helper'

RSpec.describe 'chef show page' do
  describe 'As a visiter' do
    it 'has the chef name' do
      chef = Chef.create!(name: "Chef guy")
      visit "/chefs/#{chef.id}"
      expect(page).to have_content(chef.name)
    end

    it 'has a link to all the ingredients that the chef uses' do
      chef = Chef.create!(name: "Chef guy")
      pizza = Dish.create!(name: "pizza", description: "it is pizza...", ingredients: "sauce, cheese, jalapenos", calories: 400, chef_id: chef.id)

      visit "/chefs/#{chef.id}"
      expect(page).to have_content(pizza.ingredients)
    end

  end
end
