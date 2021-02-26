require "rails_helper"

RSpec.describe "Dish Show Page" do
  describe "When I visit a dish's show page" do
    it "I see the dish’s name and description, list of ingredients, chef's name and total calories for that dish" do
      chef1 = Chef.create(name:"Bob")
      chef2 = Chef.create(name:"Alex")
      dish1 = chef1.dishes.create(name: 'Spaghetti and Meatballs', description: "An Italian classic")
      dish2 = chef2.dishes.create(name: 'Fish and Chips', description: "A pub favorite")
      ingredient1 = dish1.ingredients.create(name: 'pasta', calories: 250)
      ingredient2 = dish1.ingredients.create(name: 'marinara sauce', calories: 100)
      ingredient3 = dish1.ingredients.create(name: 'meatballs', calories: 700)
      ingredient4 = dish2.ingredients.create(name: ' fried whitefish', calories: 600)
      ingredient5 = dish2.ingredients.create(name: 'potato chips', calories: 400)

      dish1.ingredients << [ingredient1, ingredient2, ingredient3]

      # dish_ingredient1 = DishIngredient.create(dish_id: dish1.id, ingredient_id: ingredient1.id)
      # dish_ingredient2 = DishIngredient.create(dish_id: dish1.id, ingredient_id: ingredient2.id)
      # dish_ingredient3 = DishIngredient.create(dish_id: dish1.id, ingredient_id: ingredient3.id)

      visit "/dishes/#{dish1.id}"

      expect(page).to have_content(dish1.name)
      expect(page).to have_content(dish1.description)
      expect(page).to_not have_content(dish2.name)
      expect(page).to_not have_content(dish2.description)

      within("#ingredient-list") do
        expect(page).to have_content(ingredient1.name)
        expect(page).to have_content(ingredient2.name)
        expect(page).to have_content(ingredient3.name)
      end

      within("#chef-#{chef1.id}") do
        expect(page).to have_content(chef1.name)
      end

      within("#total-calories") do
        expect(page).to have_content("Total Calories for #{dish1.name}: #{dish1.total_calories}")
      end
    end
  end
end
