require 'rails_helper'

describe "As a visitor" do
  describe "When I visit a dish's show page" do
    it "I see the dish’s name and description, with a list of ingredients and chef's name" do
      chef = Chef.create!(name: "Bob Newhart")
      dish = Dish.create!(
        name: "Spaghetti",
        description: "Spaghetti and Meatballs",
        chef_id: chef.id
      )
      pasta = Ingredient.create!(
        name: "Pasta",
        calories: 150
      )
      sauce = Ingredient.create!(
        name: "Marinara Sauce",
        calories: 75
      )
      meatballs = Ingredient.create!(
        name: "Meatballs",
        calories: 300
      )
      DishIngredient.create!(
        dish_id: dish.id,
        ingredient_id: pasta.id
      )
      DishIngredient.create!(
        dish_id: dish.id,
        ingredient_id: sauce.id
      )
      DishIngredient.create!(
        dish_id: dish.id,
        ingredient_id: meatballs.id
      )

      visit "/dishes/#{dish.id}"

      expect(page).to have_content(dish.name)
      expect(page).to have_content("#{dish.description}")
      within "#dishingredients" do
        expect(page).to have_content("#{pasta.name}")
        expect(page).to have_content("#{sauce.name}")
        expect(page).to have_content("#{meatballs.name}")
      end
      expect(page).to have_content("Chef: #{chef.name}")
    end

    it "I see total calories of that dish" do
      chef = Chef.create!(name: "Bob Newhart")
      dish = Dish.create!(
        name: "Spaghetti",
        description: "Spaghetti and Meatballs",
        chef_id: chef.id
      )
      pasta = Ingredient.create!(
        name: "Pasta",
        calories: 150
      )
      sauce = Ingredient.create!(
        name: "Marinara Sauce",
        calories: 75
      )
      meatballs = Ingredient.create!(
        name: "Meatballs",
        calories: 300
      )
      DishIngredient.create!(
        dish_id: dish.id,
        ingredient_id: pasta.id
      )
      DishIngredient.create!(
        dish_id: dish.id,
        ingredient_id: sauce.id
      )
      DishIngredient.create!(
        dish_id: dish.id,
        ingredient_id: meatballs.id
      )

      visit "/dishes/#{dish.id}"

      expect(page).to have_content("Total Calories: #{dish.total_calories}")
    end
  end
end
