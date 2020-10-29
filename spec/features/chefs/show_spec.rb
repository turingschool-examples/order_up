require 'rails_helper'

# As a visitor
# When I visit a chef's show page
# I see the name of that chef
# And I see a link to view a list of all ingredients that this chef uses in their dishes
# When I click on that link
# I'm taken to a chef's ingredient index page
# and I can see a unique list of names of all the ingredients that this chef uses

describe 'As a visitor' do
  describe "When I visit a chef's show page" do
    before :each do
      @chef1 = Chef.create({name: "Ralph"})
      @dishr = @chef1.dishes.create({name: "pasta w red sauce", description: "noodles and red sauce"})
      @dishw = @chef1.dishes.create({name: "pasta w white sauce", description: "noodles and white sauce"})
      @noodles = Ingredient.create({name: "noodles", calories: 100})
      @wsauce = Ingredient.create({name: "white sauce", calories: 80})
      @rsauce = Ingredient.create({name: "red sauce", calories: 75})
      @dishr_noodles = DishIngredient.create({dish_id: @dishr.id, ingredient_id: @noodles.id})
      @dishr_rsauce = DishIngredient.create({dish_id: @dishr.id, ingredient_id: @rsauce.id})
      @dishw_noodles = DishIngredient.create({dish_id: @dishw.id, ingredient_id: @noodles.id})
      @dishw_wsauce = DishIngredient.create({dish_id: @dishw.id, ingredient_id: @wsauce.id})
    end
    it "I see the chef's name and a link to view all his ingredients" do
      visit "/chefs/#{@chef1.id}"
      expect(page).to have_content("Chef Name: #{@chef1.name}")
      expect(page).to have_link("Chef's Ingredients")
    end
    it "when I click on Chef's ingredients link I'm taken to the chefs ingredients page" do
      visit "/chefs/#{@chef1.id}"
      expect(page).to have_content("Chef Name: #{@chef1.name}")
      click_link("Chef's Ingredients")
      expect(current_path).to eq("/chefs/#{@chef1.id}/ingredients")
    end
  end
end
