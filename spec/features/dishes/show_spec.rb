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
  end

  describe "When I visit a dish's show page" do
    it "shows the dish’s name and description, a list of ingredients for that dish, and the chef's name" do
      visit "/dishes/#{@dish.id}"

      expect(page).to have_content(@dish.name)
      expect(page).to have_content(@dish.description)
      expect(page).to have_content(@cheese.name)
      expect(page).to have_content(@pasta.name)
      expect(page).to have_content(@breadcrumbs.name)
      expect(page).to have_content(@chef.name)
    end
  end
end
