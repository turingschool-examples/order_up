require "rails_helper"

describe "As a visitor" do
  describe "When I visit a chef's show page" do
    it "I see the name of that chef, And I see a link to view a list of all ingredients that this chef uses in their dishes" do
      bob = Chef.create!(name: "Bob")
      pasta = Dish.create!(name: "Pasta", description: "Noodle Dish", chef_id: bob.id)
      noodles = Ingredient.create!(name: "Noodles", calories: 50)
      sause = Ingredient.create!(name: "Sause", calories: 100)
      meatballs = Ingredient.create!(name: "Meatballs", calories: 150)

      DishIngredient.create!(dish_id: pasta.id, ingredient_id: noodles.id)
      DishIngredient.create!(dish_id: pasta.id, ingredient_id: sause.id)
      DishIngredient.create!(dish_id: pasta.id, ingredient_id: meatballs.id)

      visit "/chefs/#{bob.id}"

      expect(page).to have_content(bob.name)
      expect(page).to have_link("All Ingredients")
    end
  end
end
