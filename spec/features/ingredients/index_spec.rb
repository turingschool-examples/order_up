require 'rails_helper'

describe "As a visitor" do
  describe "When I visit chef's ingredients index" do
    it "I see a list of all ingredient that chef uses" do
      chef = Chef.create!(name: "Bob Newhart")
      dish_1 = Dish.create!(
        name: "Spaghetti",
        description: "Spaghetti and Meatballs",
        chef_id: chef.id
      )
      dish_2 = Dish.create!(
        name: "Hot Dogs Marinara",
        description: "Hot Dog with bun covered in marinara",
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
      DishIngredient.create!(
        dish_id: dish_2.id,
        ingredient_id: sauce.id
      )

      visit "/chefs/#{chef.id}/ingredients"

      expect(page).to have_content(pasta.name)
      expect(page).to have_content(sauce.name)
      expect(page).to have_content(meatballs.name)
      expect(page).to have_content(hot_dog.name)
      expect(page).to have_content(bun.name)
    end
  end
end
