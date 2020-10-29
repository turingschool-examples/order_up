require 'rails_helper'

describe "As a visitor" do
  describe "When I visit a dish's show page" do

    before :each do
      @beef = Ingredient.create(name: "Beef", calories: 200)
      @flour = Ingredient.create(name: "Flour", calories: 25)
      @egg = Ingredient.create(name: "Egg", calories: 8)

      @chef = Chef.create(name: "Boirdee")
      @dish = @chef.dishes.create(name: "Speghetti and meatballs", description: "An Italian Classic")

      Recipe.create(ingredient_id: @beef.id, dish_id: @dish.id)
      Recipe.create(ingredient_id: @flour.id, dish_id: @dish.id)
      Recipe.create(ingredient_id: @egg.id, dish_id: @dish.id)
    end
    it "Has the dish name, description, list of ingrediants and the chef's name" do

      visit "/dishes/#{@dish.id}"

      expect(page).to have_content(@dish.name)
      expect(page).to have_content(@dish.description)

      within '#ingredients' do
        expect(page).to have_content(@beef.name)
        expect(page).to have_content(@flour.name)
        expect(page).to have_content(@egg.name)
      end

      expect(page).to have_content(@chef.name)
    end
    it "Shows the total calorie count of that dish" do
      visit "/dishes/#{@dish.id}"

      expect(page).to have_content(@dish.total_calories)
      expect(@dish.total_calories).to eq(233)
    end
  end
end
