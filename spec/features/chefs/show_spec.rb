require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  before :each do
    @chef = Chef.create(name: "Chef")

    @dish_1 = @chef.dishes.create(name: "Dish 1", description: "Dish 1 description")
    @dish_2 = @chef.dishes.create(name: "Dish 1", description: "Dish 1 description")

    @ingredient1 = Ingredient.create(name: "Ingredient 1", calories: 100)
    @ingredient2 = Ingredient.create(name: "Ingredient 2", calories: 20)
    @ingredient3 = Ingredient.create(name: "Ingredient 3", calories: 10)
    @ingredient4 = Ingredient.create(name: "Ingredient 4", calories: 100)
    @ingredient5 = Ingredient.create(name: "Ingredient 5", calories: 20)
    @ingredient6 = Ingredient.create(name: "Ingredient 6", calories: 10)

    DishIngredient.create(dish_id: @dish_1.id, ingredient_id: @ingredient1.id)
    DishIngredient.create(dish_id: @dish_1.id, ingredient_id: @ingredient2.id)
    DishIngredient.create(dish_id: @dish_1.id, ingredient_id: @ingredient3.id)
    DishIngredient.create(dish_id: @dish_2.id, ingredient_id: @ingredient3.id)
    DishIngredient.create(dish_id: @dish_2.id, ingredient_id: @ingredient3.id)
    DishIngredient.create(dish_id: @dish_2.id, ingredient_id: @ingredient3.id)
  end

  describe "When I visit a chef's show page" do
    it "I see the name of that chef And I see a link to view a list of all ingredients that this chef uses in their dishes" do

      visit "/chefs/#{@chef.id}"

      expect(page).to have_content("#{@chef.name}")

      expect(page).to have_link("List of Ingredients")
      click_on "List of Ingredients"

      expect(current_path).to eq("/chefs/#{@chef.id}/ingredients")

      expect(page).to have_content("List of Ingredients Used by Chef #{@chef.name}")

      expect(page).to have_content("#{@ingredient1.name}")
      expect(page).to have_content("#{@ingredient2.name}")
      expect(page).to have_content("#{@ingredient3.name}")
      expect(page).to have_content("#{@ingredient4.name}")
      expect(page).to have_content("#{@ingredient5.name}")
      expect(page).to have_content("#{@ingredient6.name}")
      expect(page).to have_content("#{@ingredient7.name}")
    end
  end

end