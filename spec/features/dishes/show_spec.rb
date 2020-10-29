# Story 1 of 3
# As a visitor
# When I visit a dish's show page
# I see the dish’s name and description
# And I see a list of ingredients for that dish
# And I see the chef's name
require 'rails_helper'
describe "As a visitor" do
  describe "When I visit a dish's show page" do
    it "I see the dish name, description, ingredients, and chef name" do
      tanaka = Chef.create!(name: "Chef Tanaka")
      sushi = tanaka.dishes.create!(name: "Sushi",
                                    description: "Awesome",
                                    ingredients: "fish, rice, wasabi",
                                    chef: "Chef Tanaka"
                                   )
      visit "/dishes/#{sushi.id}"

      expect(page).to have_content(sushi.name)
      expect(page).to have_content(sushi.description)
      expect(page).to have_content(sushi.ingredients)
      expect(page).to have_content(sushi.chef)
    end
  end
end
