require 'rails_helper'

RSpec.describe "Chef's ingredients page", type: :feature do
  before :each do
    @chef1 = Chef.create(name: "Gordon Ramsay")
    @dish1 = @chef1.dishes.create(name: "Beef Wellington", description: "Amazing")
    @dish2 = @chef1.dishes.create(name: "Fish and Chips", description: "Oh yeah")
    @ingredient1 = Ingredient.create(name: "Beef", calories: 100)
    @ingredient3 = Ingredient.create(name: "Fish", calories: 50)
    @ingredient4 = Ingredient.create(name: "Fries", calories: 350)
    @ingredient5 = Ingredient.create(name: "Bread Crumbs", calories: 35)
    DishIngredient.create(dish: @dish1, ingredient: @ingredient1)
    DishIngredient.create(dish: @dish2, ingredient: @ingredient3)
    DishIngredient.create(dish: @dish2, ingredient: @ingredient4)
    DishIngredient.create(dish: @dish1, ingredient: @ingredient5)

  end
  describe "When I visit a Chef's ingredients page" do
    # and I can see a unique list of names of all the ingredients that this chef uses
    it "can see a list of all the chef's used ingredients" do
      visit "/chefs/#{@chef1.id}/ingredients"

      within(".ingredient-#{@ingredient1.id}") do
        expect(page).to have_content(@ingredient1.name)
        expect(page).to have_content(@ingredient1.calories)
      end
      within(".ingredient-#{@ingredient3.id}") do
        expect(page).to have_content(@ingredient3.name)
        expect(page).to have_content(@ingredient3.calories)
      end
      within(".ingredient-#{@ingredient4.id}") do
        expect(page).to have_content(@ingredient4.name)
        expect(page).to have_content(@ingredient4.calories)
      end
      within(".ingredient-#{@ingredient5.id}") do
        expect(page).to have_content(@ingredient5.name)
        expect(page).to have_content(@ingredient5.calories)
      end
    end
  end
end