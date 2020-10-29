# Story 1 of 3
# As a visitor
# When I visit a dish's show page
# I see the dish’s name and description
# And I see a list of ingredients for that dish
# And I see the chef's name
require 'rails_helper'
describe "As a visitor" do
  describe "When I visit a dish's show page" do
      tanaka = Chef.create!(name: "Chef Tanaka")
      sushi = tanaka.dishes.create!(name: "Sushi",
                                    description: "Awesome",
                                   )
      salmon = Ingredient.create!(name: "Salmon", calories: 50)
      rice = Ingredient.create!(name: "Rice", calories: 80)
      wasabi = Ingredient.create!(name: "Wasabi", calories: 10)
      DishIngredient.create!(dish: sushi, ingredient: salmon)
      DishIngredient.create!(dish: sushi, ingredient: rice)
      DishIngredient.create!(dish: sushi, ingredient: wasabi)

    it "I see the dish name, description, ingredients, and chef name" do

      visit "/dishes/#{sushi.id}"

      expect(page).to have_content(sushi.name)
      expect(page).to have_content(sushi.description)
      expect(page).to have_content(salmon.name)
      expect(page).to have_content(rice.name)
      expect(page).to have_content(wasabi.name)
      expect(page).to have_content(tanaka.name)

      expect(page).to have_content("Dish Total Calories:")
      expect(page).to have_content(140)
    end
  end
end
