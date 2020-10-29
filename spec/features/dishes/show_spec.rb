require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  describe "When I visit a dish's show page" do
    

    before(:each) do
      @chef = Chef.create!(
        name: "SpongeBob"
      )

      @burger = Dish.create!(
        name: "Krabby Patty",
        description: "Delicious undersea burger",
        chef_id: @chef.id
      )

      @fries = Dish.create!(
        name: "Kelp Fries",
        description: "Perfect side to a Krabby Patty",
        chef_id: @chef.id
      )

      @patty = Ingredient.create!(
        name: "Burger Patty",
        calories: 300
      )

      @lettuce = Ingredient.create!(
        name: "Lettuce",
        calories: 10
      )

      @bun = Ingredient.create!(
        name: "Burger Bun",
        calories: 30
      )

      @kelp = Ingredient.create!(
        name: "Kelp",
        calories: 10
      )

      Recipe.create!(
        dish_id: @burger.id,
        ingredient_id: @patty.id 
      )

      Recipe.create!(
        dish_id: @burger.id,
        ingredient_id: @lettuce.id 
      )

      Recipe.create!(
        dish_id: @burger.id,
        ingredient_id: @bun.id 
      )

      Recipe.create!(
        dish_id: @fries.id,
        ingredient_id: @kelp.id 
      )
    end 
    it 'I see a dishes name, description, ingredients, and chefs name' do
      visit "/dishes/#{@burger.id}"

      expect(page).to have_content("Krabby Patty")
      expect(page).to have_content("Delicious undersea burger")
      expect(page).to have_content("Ingredients:")
      expect(page).to have_content("Burger Patty")
      expect(page).to have_content("Lettuce")
      expect(page).to have_content("Burger Bun")
      expect(page).to have_content("Chef: SpongeBob")
    end
  end
  
end