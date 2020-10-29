require 'rails_helper'

describe "As a visitor" do

  before :each do
    @chef = Chef.create!(name: "Chef Casey")
    @dish = @chef.dishes.create!(name: "Mac n Cheese", description: "Creammy goodness")
    @cheese = Ingredient.create!(name: "Cheese", calories: 750)
    @pasta = Ingredient.create!(name: "Pasta", calories: 300)
    @breadcrumbs = Ingredient.create!(name: "Breadcrumbs", calories: 175)
    DishIngredient.create!(dish_id: @dish.id, ingredient_id: @cheese.id)
    DishIngredient.create!(dish_id: @dish.id, ingredient_id: @pasta.id)
    DishIngredient.create!(dish_id: @dish.id, ingredient_id: @breadcrumbs.id)
    @dish_2 = @chef.dishes.create!(name: "Pizza", description: "Amazing")
    @dough = Ingredient.create!(name: "Dough", calories: 300)
    DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @cheese.id)
    DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @dough.id)
    @dish_3 = @chef.dishes.create!(name: "Calzone", description: "Folded Pizza")
    DishIngredient.create!(dish_id: @dish_3.id, ingredient_id: @cheese.id)
    DishIngredient.create!(dish_id: @dish_3.id, ingredient_id: @dough.id)
    @dish_4 = @chef.dishes.create!(name: "Pasta Special", description: "Daily Special")
    @pasta = Ingredient.create!(name: "Pasta", calories: 300)
    @butter = Ingredient.create!(name: "Butter", calories: 500)
    DishIngredient.create!(dish_id: @dish_4.id, ingredient_id: @pasta.id)
    DishIngredient.create!(dish_id: @dish_4.id, ingredient_id: @butter.id)
  end

  describe "When I visit a chef's show page" do
    it "shows the name of that chef and a link to view a list of all ingredients that this chef uses in their dishes" do
      visit "/chefs/#{@chef.id}"

      expect(page).to have_content(@chef.name)
      expect(page).to have_link("View All Ingredients")
    end
  end

  describe "When I click on that link to view a list of all ingredients" do
    it "I'm taken to a chef's ingredient index page and I can see a unique list of names of all the ingredients that this chef uses" do
      visit "/chefs/#{@chef.id}"

      click_link("View All Ingredients")

      expect(current_path).to eq("/chefs/#{@chef.id}/ingredients")
      expect(page).to have_content("Ingredients")
      expect(page).to have_content(@cheese.name)
      expect(page).to have_content(@pasta.name)
      expect(page).to have_content(@breadcrumbs.name)
      expect(page).to have_content(@dough.name)
    end
  end

  describe "When I visit a chef's show page" do
    xit "I see the three most popular ingredients that the chef uses in their dishes (Popularity is based off of how many dishes use that ingredient)" do
      visit "/chefs/#{@chef.id}"

      expect(page).to have_content("3 Most Popular Ingredients")

      within "#popular" do
        expect(page).to have_content(@cheese.name)
        expect(page).to have_content(@dough.name)
        expect(page).to have_content(@pasta.name)
      end
    end
  end
end
