require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  describe "When I visit a dish's show page" do
    it "I see the dish’s name and description, And I see a list of ingredients for that dish, And I see the chef's name" do
      chef_1 = Chef.create!(name: "Jean Pierre")
      dish_1 = chef_1.dishes.create!(name: "Pizza", description: "A cheese pizza")
      
      ingredient_1 = Ingredient.create(name: "Butter", calories: 190)
      ingredient_2 = Ingredient.create(name: "Cheese", calories: 190)
      ingredient_3 = Ingredient.create(name: "Flour", calories: 150)

      dish_ingredient_1 =dish_1.dish_ingredients.create!(ingredient_id: ingredient_1.id)
      dish_ingredient_2 =dish_1.dish_ingredients.create!(ingredient_id: ingredient_2.id)
      dish_ingredient_3 =dish_1.dish_ingredients.create!(ingredient_id: ingredient_3.id)

      visit "/dishes/#{dish_1.id}"
      expect(page).to have_content("#{chef_1.name}")
      expect(page).to have_content(dish_1.name)
      expect(page).to have_content(dish_1.description)
      expect(page).to have_content("#{ingredient_1.name}")
      expect(page).to have_content("#{ingredient_2.name}")
      expect(page).to have_content("#{ingredient_3.name}")
      expect(page).to have_content("#{dish_1.ingredients.sum(:calories)}")
    end
  end
end
