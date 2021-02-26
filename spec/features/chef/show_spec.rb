require "rails_helper"

RSpec.describe "As a visitor" do
  before(:each) do
    @chef = Chef.create!(name: "Big Sloppy Sal")
    @dish_1 = @chef.dishes.create!(name: "Pizza", description: "Better than your mothers!")

    @sauce = Ingredient.create!(name: "tomatoe sauce", calories: 50)
    @cheese = Ingredient.create!(name: "cheese", calories: 150)
    @dough = Ingredient.create!(name: "pizza dough", calories: 100)

    DishIngredient.create!(dish: @dish_1, ingredient: @sauce)
    DishIngredient.create!(dish: @dish_1, ingredient: @cheese)
    DishIngredient.create!(dish: @dish_1, ingredient: @dough)
  end

  describe "when I visit a chef show page" do
    it "I see the name of a chef and a link to their ingredient page" do

      visit "/chefs/#{@chef.id}"

      expect(page).to have_content("Chef Name")
      expect(page).to have_content(@chef.name)

      expect(page).to have_link "Chef's ingredient"


    end

    it "when I click the link for the chefs ingredients I am take to a page listing the ingredients" do
      visit "/chefs/#{@chef.id}"

      click_link

      expect(page).to have_content(@sauce.name)
      expect(page).to have_content(@cheese.name)
      expect(page).to have_content(@dough.name)

    end
  end
end
