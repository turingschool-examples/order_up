require 'rails_helper'

describe "As a visitor" do
  describe "When I visit a chef's show page I see a link to view all the ingredients this chef uses in their dishes" do
    it "When I click I'm redirected to the chef's ingredients index page" do
      chef = Chef.create!(name: "Bob Newhart")
      dish_1 = Dish.create!(
        name: "Spaghetti",
        description: "Spaghetti and Meatballs",
        chef_id: chef.id
      )
      dish_2 = Dish.create!(
        name: "Hot Dog",
        description: "Hot Dog with bun",
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
      hot_dog = Ingredient.create!(
        name: "Hot Dog",
        calories: 400
      )
      bun = Ingredient.create!(
        name: "Bun",
        calories: 150
      )
      DishIngredient.create!(
        dish_id: dish_1.id,
        ingredient_id: pasta.id
      )
      DishIngredient.create!(
        dish_id: dish_1.id,
        ingredient_id: sauce.id
      )
      DishIngredient.create!(
        dish_id: dish_1.id,
        ingredient_id: meatballs.id
      )
      DishIngredient.create!(
        dish_id: dish_2.id,
        ingredient_id: hot_dog.id
      )
      DishIngredient.create!(
        dish_id: dish_2.id,
        ingredient_id: bun.id
      )

      visit "/chefs/#{chef.id}"

      expect(page).to have_content(chef.name)

      click_link "See all the ingredients I use!"

      expect(current_path).to eq("/chefs/#{chef.id}/ingredients")
    end
  end
end
# I see the name of that chef
# And I see a link to view a list of all ingredients that this chef uses in their dishes
# When I click on that link
# I'm taken to a chef's ingredient index page
# and I can see a unique list of names of all the ingredients that this chef uses
