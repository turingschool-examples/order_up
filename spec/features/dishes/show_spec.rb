require "rails_helper"

describe 'As a visitor' do
  describe "When I visit a dish's show page" do
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

    it "I see a list of ingredients for that dish and the chef's name" do
      visit "/dishes/#{@dish_1.id}"

      expect(page).to have_content(@dish_1.name)
      expect(page).to have_content(@dish_1.description)
      expect(page).to have_content(@chef_1.name)
      expect(page).to have_content(@egg.name)
      expect(page).to have_content(@butter.name)
      expect(page).to have_content(@sugar.name)
    end

    it "I see the total calorie count for that dish" do
      visit "/dishes/#{@dish_1.id}"

      expect(page).to have_content(@dish_1.total_calories)
    end
  end
end
