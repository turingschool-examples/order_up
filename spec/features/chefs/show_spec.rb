#Story 3 of 3
require 'rails_helper'
describe "As a visitor" do
  before(:each) do
    @chef = Chef.create!(name: "boyardee")
    @dish = Dish.create!(name: 'cornbread',
                        description: 'bread',
                        chef_id: @chef.id)
    @ingredient1 = Ingredient.create!(name: 'corn',
                                      calories: 100)
    @ingredient2 = Ingredient.create!(name: 'butter',
                                      calories: 500)
    DishesIngredient.create!(dish: @dish, ingredient: @ingredient1)
    DishesIngredient.create!(dish: @dish, ingredient: @ingredient2)
  end
  describe "When I visit a chef's show page" do
    it "I see the name of that chef" do
      visit "/chefs/#{@chef.id}"
      expect(page).to have_content(@chef.id)
    end
    it "And I see a link to view a list of all ingredients that this chef uses in their dishes" do
      visit "/chefs/#{@chef.id}"
      expect(page).to have_link("Ingredients")

    end
  end
  describe "When I click on that link" do
    it "I'm taken to a chef's ingredient index page" do
      visit "/chefs/#{@chef.id}"
      click_on("Ingredients")
      expect(current_path).to eq("/chefs/#{chef.id}/ingredients")
    end
    it "and I can see a unique list of names of all the ingredients that this chef uses" do
      visit "/chefs/#{chef.id}/ingredients"
      expect(page).to have_content(@ingredient1.name)
      expect(page).to have_content(@ingredient2.name)
    end
  end
end
