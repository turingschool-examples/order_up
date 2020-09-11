require "rails_helper"

RSpec.describe "Dish show page", type: :feature do
  describe "As a visitor to dish show page" do
    before :each do
      @chef = Chef.create(name: "Mike Dao")
      @dish = @chef.dishes.create(name: "Pizza", description: "Delicious", calorie_count: 600)
      @dish.ingredient << Ingredient.create(name: "Cheese")
      @dish.ingredient << Ingredient.create(name: "Sausage")
    end
    it "I can see a the dish's name and description" do


      visit "/dish/#{@dish.id}"

      expect(page).to have_content(@dish.name)
      expect(page).to have_content(@dish.description)
    end

    it "I can see a list of ingredients for that dish" do
      visit "/dish/#{@dish.id}"

      expect(page).to have_content("Cheese")
      expect(page).to have_content("Sausage")
    end

    it "I can see the chef's name" do
      visit "/dish/#{@dish.id}"
      expect(page).to have_content(@chef.name)
    end

    it "I can see a total calorie count for that dish" do
      visit "/dish/#{@dish.id}"

      expect(page).to have_content(@dish.calorie_count)
    end
  end
#   Story 2 of 3
# As a visitor
# When I visit a dish's show page
# I see the total calorie count for that dish.
end
