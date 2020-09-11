require "rails_helper"

RSpec.describe "Chef show page", type: :feature do
  describe "As a visitor" do
    before :each do
      @chef = Chef.create(name: "Mike Dao")
      @dish = @chef.dishes.create(name: "Pizza", description: "Delicious", calorie_count: 600)
      @dish.ingredient << Ingredient.create(name: "Cheese")
      @dish.ingredient << Ingredient.create(name: "Sausage")
    end

    it "can see the name of the chef" do
      visit "/chef/#{@chef.id}"
      expect(page).to have_content(@chef.name)
    end

    it "see a link to view a list of all ingredients used by this chef" do
      visit "/chef/#{@chef.id}"
      expect(page).to have_link("Ingredients Used")
    end

    it "after clicking link I am taken to an ingredients index page" do
      visit "/chef/#{@chef.id}"
      click_link "Ingredients Used"
      expect(current_path).to eq("/chef/#{@chef.id}/ingredients")
      expect(page).to have_content(@chef.name)
    end

  end
#   Story 3 of 3
# As a visitor
# When I visit a chef's show page
# I see the name of that chef
# And I see a link to view a list of all ingredients that this chef uses in their dishes
# When I click on that link
# I'm taken to a chef's ingredient index page
# and I can see a unique list of names of all the ingredients that this chef uses
end
