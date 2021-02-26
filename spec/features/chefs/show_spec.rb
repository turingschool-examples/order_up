require 'rails_helper'

RSpec.describe 'When a user visits a chefs show page', type: :feature do
  before(:each) do
    @chef = Chef.create!(name: "Gordan Ramsey")
    @dish_1 = @chef.dishes.create!(name: "Burrito", description: "A simple bean and cheese burrito")
    @tortilla = Ingredient.create!(name: "Tortilla", calories: 200)
    @beans = Ingredient.create!(name: "Pinto Beans", calories: 150)
    @cheese = Ingredient.create!(name: "Sharp Chedder", calories: 175)
    DishIngredient.create!(dish: @dish_1, ingredient: @tortilla)
    DishIngredient.create!(dish: @dish_1, ingredient: @beans)
    DishIngredient.create!(dish: @dish_1, ingredient: @cheese)
  end

  describe "As a visitor" do
    describe "When I visit a chef's show page" do
      it "Displays the chef's name and description" do
        visit chef_path(@chef.id)

        expect(page).to have_content("Gordan Ramsey")
        expect(page).to have_link("Chef's Ingredients", :href => "/chefs/#{@chef.id}/ingredients")

        click_on("Chef's Ingredients")
        expect(current_path).to eq("/chefs/#{@chef.id}/ingredients")

        expect(page).to have_content("Gordan Ramsey Ingredient's Page")
        expect(page).to have_content("Tortilla")
        expect(page).to have_content("Pinto Bean")
        expect(page).to have_content("Sharp Chedder")
      end
    end
  end
end
