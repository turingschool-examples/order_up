require "rails_helper"

# Story 3 of 3
# As a visitor
# When I visit a chef's show page
# I see the name of that chef
# And I see a link to view a list of all ingredients that this chef uses in their dishes

# When I click on that link
# I'm taken to a chef's ingredient index page
# and I can see a unique list of names of all the ingredients that this chef uses

describe "As a visitor" do
  describe "When I visit a chef's show page" do
    describe "And I click on the All Ingredients link, it should take me to the chef's ingredient index page" do
      it "I can see a unique list of names of all the ingredients that this chef uses" do
        bob = Chef.create!(name: "Bob")
        pasta = Dish.create!(name: "Pasta", description: "Noodle Dish", chef_id: bob.id)
        noodles = Ingredient.create!(name: "Noodles", calories: 50)
        sause = Ingredient.create!(name: "Sause", calories: 100)
        meatballs = Ingredient.create!(name: "Meatballs", calories: 150)
        tacos = Dish.create!(name: "Tacos", description: "Chicken Tacos", chef_id: bob.id)
        shell = Ingredient.create!(name: "Taco Shell", calories: 20)
        chicken = Ingredient.create!(name: "Chicken Breast", calories: 120)
        lettuce = Ingredient.create!(name: "Romane Lettuce", calories: 30)
        sause = Ingredient.create!(name: "Sauce", calories: 100)

        DishIngredient.create!(dish_id: pasta.id, ingredient_id: noodles.id)
        DishIngredient.create!(dish_id: pasta.id, ingredient_id: sause.id)
        DishIngredient.create!(dish_id: pasta.id, ingredient_id: meatballs.id)

        DishIngredient.create!(dish_id: tacos.id, ingredient_id: shell.id)
        DishIngredient.create!(dish_id: tacos.id, ingredient_id: chicken.id)
        DishIngredient.create!(dish_id: tacos.id, ingredient_id: lettuce.id)
        DishIngredient.create!(dish_id: tacos.id, ingredient_id: sause.id)


        visit "/chefs/#{bob.id}"

        click_link "All Ingredients"

        expect(page).to have_content(noodles.name)
        expect(page).to have_content(sause.name)
        expect(page).to have_content(meatballs.name)
        expect(page).to have_content(shell.name)
        expect(page).to have_content(chicken.name)
        expect(page).to have_content(lettuce.name)
        expect(page).to have_content(sause.name)
      end
    end
  end
end
