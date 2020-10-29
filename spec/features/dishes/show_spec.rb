require "rails_helper"

describe 'As a visitor' do
  describe "When I visit a dish's show page" do
    it "I see a list of ingredients for that dish and the chef's name" do
      chef_1 = Chef.create!(name: "Mike Dao")
      dish_1 = Dish.create!({name: "Pancakes", description: "Yummy, fluffy, buttery, goodness", chef_id: chef_1.id})
      egg = Ingredient.create!(name: "egg")
      butter = Ingredient.create!(name: "butter")
      sugar = Ingredient.create!(name: "sugar")
      DishIngredient.create!({dish_id: dish_1.id, ingredient_id: egg.id})
      DishIngredient.create!({dish_id: dish_1.id, ingredient_id: butter.id})
      DishIngredient.create!({dish_id: dish_1.id, ingredient_id: sugar.id})

      visit "/dishes/#{dish_1.id}"

      expect(page).to have_content(dish_1.name)
      expect(page).to have_content(dish_1.description)
      expect(page).to have_content(chef_1.name)
      expect(page).to have_content(egg.name)
      expect(page).to have_content(butter.name)
      expect(page).to have_content(sugar.name)
    end
  end
end
