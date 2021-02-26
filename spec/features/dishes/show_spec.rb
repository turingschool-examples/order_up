require 'rails_helper'

RSpec.describe "Dish Show page", type: :feature do
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
  describe "When I visit a Dishes Show page" do
    # I see the dish’s name and description
    it "Sees the name and description for that dish" do
      visit "/dishes/#{@dish1.id}"

      within(".attributes") do
        expect(page).to have_content(@dish1.name)
        expect(page).to have_content(@dish1.description)
      end
    end
    # And I see a list of ingredients for that dish
    it "sees a list of ingredients for that dish" do
      visit "/dishes/#{@dish1.id}"

      within(".ingredients") do
        expect(page).to have_content(@ingredient1.name)
        expect(page).to have_content(@ingredient5.name)
      end
    end
    # And I see the chef's name
    it "sees the chef's name" do
      visit "/dishes/#{@dish1.id}"

      within(".attributes") do
        expect(page).to have_content(@chef1.name)
      end
    end
    # And I see the total calorie count for that dish.
    it "sees the total calories for that dish" do
      visit "/dishes/#{@dish1.id}"
      
      within(".calories") do
        expect(page).to have_content(@dish1.calories)
        expect(page).to have_content(135)
      end
    end
  end
end