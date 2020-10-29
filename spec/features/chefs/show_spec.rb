require "rails_helper"

describe 'As a visitor' do
  describe "When I visit a chef's show page" do
    before :each do
      @chef_1 = Chef.create!(name: "Mike Dao")

      @dish_1 = Dish.create!({name: "Pancakes", description: "Yummy, fluffy, buttery, goodness", chef_id: @chef_1.id})

      @egg = Ingredient.create!(name: "egg", calories: 80)
      @butter = Ingredient.create!(name: "butter", calories: 90)
      @sugar = Ingredient.create!(name: "sugar", calories: 100)
  
      DishIngredient.create!({dish_id: @dish_1.id, ingredient_id: @egg.id})
      DishIngredient.create!({dish_id: @dish_1.id, ingredient_id: @butter.id})
      DishIngredient.create!({dish_id: @dish_1.id, ingredient_id: @sugar.id})
    end

    it "I see the name of that chef and a link to view all ingredients they use" do

      visit "/chefs/#{@chef_1.id}"

      expect(page).to have_content(@chef_1.name)
      expect(page).to have_link("View Ingredients Used By #{@chef_1.name}!")
    end

    it "when I click the view ingredients link, I am taken to chef's ingredient index page" do
      visit "/chefs/#{@chef_1.id}"

      click_link "View Ingredients Used By #{@chef_1.name}!"

      expect(current_path).to eq("/chefs/#{@chef_1.id}/ingredients")
    end
  end
end
