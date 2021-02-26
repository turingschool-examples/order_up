require 'rails_helper'

RSpec.describe "chef show page" do
  before :each do
    @chef = Chef.create!(name: "Chef1")
    @dish1 = @chef.dishes.create!(name: "Dish1", description: "Description1")
    @dish2 = @chef.dishes.create!(name: "Dish2", description: "Description2")
    @ingredient1 = Ingredient.create!(name: "Ingredient1", calories: 7)
    @ingredient2 = Ingredient.create!(name: "Ingredient2", calories: 3)
    @ingredient3 = Ingredient.create!(name: "Ingredient3", calories: 3)

    @dish1_ingredient1 = DishIngredient.create!(dish: @dish1, ingredient: @ingredient1)
    @dish1_ingredient2 = DishIngredient.create!(dish: @dish1, ingredient: @ingredient2)
    @dish2_ingredient2 = DishIngredient.create!(dish: @dish2, ingredient: @ingredient2)
    @dish2_ingredient3 = DishIngredient.create!(dish: @dish2, ingredient: @ingredient3)
  end

  describe "when I visit the chef show page" do
    it "shows the name of the chef" do
      visit "/chefs/#{@chef.id}"

      expect(page).to have_content(@chef.name)
    end

    it "shows a link to all of the Chef's ingredients" do
      visit "/chefs/#{@chef.id}"

      expect(page).to have_link("Chef's ingredients list")
    end
  end

  describe "when the chefs ingredients list link is clicked" do
    it "takes me to the chef's ingredient index page" do
      visit "/chefs/#{@chef.id}"

      click_link("Chef's ingredients list")

      expect(current_path).to eq("/chefs/ingredients")
    end
  end
end
