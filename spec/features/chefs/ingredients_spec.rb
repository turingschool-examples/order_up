require 'rails_helper'

describe 'As a visitor' do
  describe 'When I visit the chefs show page and click on "All ingredients"' do
    it "I am taken to the ingredient index page" do
      gordon = Chef.create({name: "Gordon Ramsey"})

      visit "/chefs/#{gordon.id}"

      click_link "All Ingredients"

      expect(current_path).to eq("/chefs/#{gordon.id}/ingredients")
    end

    it "I see a list of uniq ingredients the chef uses" do
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

      chicken_alfredo = Dish.create({name: "Fettuccine Alfredo", description: "Famous pasta", chef_id: gordon.id})
      pasta = Ingredient.create({name: "Pasta", calories: 80})
      chicken = Ingredient.create({name: "Chicken", calories: 150})
      DishIngredient.create({dish_id: chicken_alfredo.id, ingredient_id: pasta.id})
      DishIngredient.create({dish_id: chicken_alfredo.id, ingredient_id: chicken.id})

      cheese = Ingredient.create({name: "Cheese", calories: 60})
      DishIngredient.create({dish_id: chicken_alfredo.id, ingredient_id: cheese.id})
      DishIngredient.create({dish_id: burger.id, ingredient_id: cheese.id})

      visit "/chefs/#{gordon.id}/ingredients"

      expect(page).to have_content(buns.name)
      expect(page).to have_content(patty.name)
      expect(page).to have_content(tomato.name)
      expect(page).to have_content(onion.name)
      
      expect(page).to have_content(cheese.name)

      expect(page).to have_content(pasta.name)
      expect(page).to have_content(chicken.name)
    end
  end
end
