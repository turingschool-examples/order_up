require 'rails_helper'

RSpec.describe "Chef Show Page", type: :feature do
  before :each do
    @chef1 = Chef.create(name: "Gordon Ramsay")
    @chef2 = Chef.create(name: "Bobby Flay")
    @dish1 = @chef1.dishes.create(name: "Beef Wellington", description: "Amazing")
    @dish2 = @chef1.dishes.create(name: "Fish and Chips", description: "Oh yeah")
    @dish3 = @chef2.dishes.create(name: "Steak Fillet", description: "juicy")
    @dish4 = @chef2.dishes.create(name: "Fish Fillet", description: "smelly")
    @ingredient1 = Ingredient.create(name: "Beef", calories: 100)
    @ingredient2 = Ingredient.create(name: "Steak", calories: 200)
    @ingredient3 = Ingredient.create(name: "Fish", calories: 50)
    @ingredient4 = Ingredient.create(name: "Fries", calories: 350)
    @ingredient5 = Ingredient.create(name: "Bread Crumbs", calories: 35)
    DishIngredient.create(dish: @dish1, ingredient: @ingredient1)
    DishIngredient.create(dish: @dish2, ingredient: @ingredient3)
    DishIngredient.create(dish: @dish2, ingredient: @ingredient4)
    DishIngredient.create(dish: @dish3, ingredient: @ingredient2)
    DishIngredient.create(dish: @dish4, ingredient: @ingredient3)
    DishIngredient.create(dish: @dish3, ingredient: @ingredient4)
    DishIngredient.create(dish: @dish1, ingredient: @ingredient5)
    DishIngredient.create(dish: @dish4, ingredient: @ingredient5)
  end
  describe "When I visit a Chef's Show page" do
    # I see the name of that chef
    it "I see the name of the chef" do
      visit "chefs/#{@chef1.id}"

      expect(page).to have_content(@chef1.name)
    end
    # And I see a link to view a list of all ingredients that this chef uses in their dishes
    it "sees a link to view a list of all ingredients that this chef uses" do
      visit "chefs/#{@chef1.id}"

      within(".links") do
        expect(page).to have_link("See this Chef's Ingredients", href: "/chefs/#{@chef1.id}/ingredients")
      end
    end
    # When I click on that link
    # I'm taken to a chef's ingredient index page
    it "can click on the ingredients link and is taken to the chefs ingredients page" do
      visit "chefs/#{@chef1.id}"

      click_on "See this Chef's Ingredients"
      
      expect(current_path).to eq("/chefs/#{@chef1.id}/ingredients")
    end
    # and I can see a unique list of names of all the ingredients that this chef uses
  end
end