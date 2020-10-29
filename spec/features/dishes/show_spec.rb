require "rails_helper"

describe "As a visitor" do
  describe "When I visit a dish's show page" do
    it "I see the dish’s name and description." do
      bob = Chef.create!(name: "Bob")
      pasta = Dish.create!(name: "Pasta", description: "Noodle Dish", chef_id: bob.id)
      noodles = Ingredient.create!(name: "Noodles", calories: 50)
      sause = Ingredient.create!(name: "Sause", calories: 100)
      meatballs = Ingredient.create!(name: "Meatballs", calories: 150)

      DishIngredient.create!(dish_id: pasta.id, ingredient_id: noodles.id)
      DishIngredient.create!(dish_id: pasta.id, ingredient_id: sause.id)
      DishIngredient.create!(dish_id: pasta.id, ingredient_id: meatballs.id)

      visit "/dishes/#{pasta.id}"

      expect(page).to have_content(pasta.name)
      expect(page).to have_content(pasta.description)
      expect(page).to have_content(noodles.name)
      expect(page).to have_content(sause.name)
      expect(page).to have_content(meatballs.name)
      expect(page).to have_content(bob.name)
    end

    it "I see the total calorie count for that dish." do
      bob = Chef.create!(name: "Bob")
      pasta = Dish.create!(name: "Pasta", description: "Noodle Dish", chef_id: bob.id)
      noodles = Ingredient.create!(name: "Noodles", calories: 50)
      sause = Ingredient.create!(name: "Sause", calories: 100)
      meatballs = Ingredient.create!(name: "Meatballs", calories: 150)

      DishIngredient.create!(dish_id: pasta.id, ingredient_id: noodles.id)
      DishIngredient.create!(dish_id: pasta.id, ingredient_id: sause.id)
      DishIngredient.create!(dish_id: pasta.id, ingredient_id: meatballs.id)

      visit "/dishes/#{pasta.id}"

      expect(page).to have_content(300)
    end
  end
end
