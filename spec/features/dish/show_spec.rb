require 'rails_helper'

RSpec.describe 'Dish show page' do
  describe 'As a visitor ' do
    before(:each) do
      @taiki = Chef.create!(name: "Joseph Taiki")
      @onion_soup = @taiki.dishes.create!(name: "Onion Soup", description: "Homemade taste with organic and local grown ingredients. Vegetarian and Vegan options available!")
      @onion = @onion_soup.ingredients.create!(name: "White Onion", calories: 5)
      @broth = @onion_soup.ingredients.create!(name: "Hearty Veggie Broth", calories: 10)
      @cheese = @onion_soup.ingredients.create!(name: "Vegan Cheese", calories: 25)

    end
    it 'I see the dish name and description' do
      visit dish_path(@onion_soup)

      expect(page).to have_content("Name: #{@onion_soup.name}")
      expect(page).to have_content("Description: #{@onion_soup.description}")
    end

    it 'And I see a list of ingredients for that dish'  do
      visit dish_path(@onion_soup)

      expect(page).to have_content("Ingredients: #{@onion.name}, #{@broth.name}, #{@cheese.name}")
    end

    it "And I see the chef's name" do
      visit dish_path(@onion_soup)

      expect(page).to have_content("Created by: Chef #{@taiki.name}")
    end

    it 'And I see the total calorie count for that dish' do
      visit dish_path(@onion_soup)

      expect(page).to have_content("Approximate total calories: #{@onion_soup.approximate_calories}")
    end
  end
end
