require 'rails_helper'

describe "As a visitor" do
  describe "When I visit a dishe's show page" do
    it "I see a dishe's name and description and chef name" do
      gordon = Chef.create({name: "Gordon Ramsey"})
      burger = Dish.create({name: "Cheese Burger", description: "Famous Burger", chef_id: gordon.id})

      visit "/dishes/#{burger.id}"

      expect(page).to have_content(gordon.name)
      expect(page).to have_content(burger.name)
      expect(page).to have_content(burger.description)
    end

    it "I see a list of ingredients for that dish" do
      gordon = Chef.create({name: "Gordon Ramsey"})
      burger = Dish.create({name: "Cheese Burger", description: "Famous Burger", chef_id: gordon.id})
      buns = Ingredient.create({name: "Buns", calories: 60})
      patty = Ingredient.create({name: 'Patty', calories: 120})
      tomato = Ingredient.create({name: 'Tomato', calories: 30})
      onion = Ingredient.create({name: 'Onion', calories: 20})
      DishIngredient.create({dish_id: burger.id, ingredient_id: buns.id})
      DishIngredient.create({dish_id: burger.id, ingredient_id: patty.id})
      DishIngredient.create({dish_id: burger.id, ingredient_id: tomato.id})
      DishIngredient.create({dish_id: burger.id, ingredient_id: onion.id})

      visit "/dishes/#{burger.id}"

      expect(page).to have_content("Ingredients")
      expect(page).to have_content(buns.name)
      expect(page).to have_content(patty.name)
      expect(page).to have_content(tomato.name)
      expect(page).to have_content(onion.name)
    end
  end
end
