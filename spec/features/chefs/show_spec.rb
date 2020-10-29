require "rails_helper"

describe "As a Visitor" do
  describe "When I visit a chefs show page" do
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
    it "Has the name of a chef with a link showing all the ingredients that shef has used" do
      visit "/chefs/#{@chef.id}"

      expect(page).to have_content(@chef.name)
      expect(page).to have_link("Ingredients")
    end
  end
end
