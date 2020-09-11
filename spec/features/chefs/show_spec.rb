require 'rails_helper'
# As a visitor
# When I visit a chef's show page
# I see the name of that chef
# And I see a link to view a list of all ingredients that this chef uses in their dishes
# When I click on that link
# I'm taken to a chef's ingredient index page
# and I can see a unique list of names of all the ingredients that this chef uses
RSpec.describe 'As a visitor' do
  describe "when I visit a chef's show page" do
    before :each do
      @chef = Chef.create!(name: 'Phil')

      @dish = @chef.dishes.create!(name: 'Grilled Cheese', description: 'Gooey cheese bread')
      @dish2 = @chef.dishes.create!(name: 'Pizza', description: 'So good')

      @ingredient_1 = Ingredient.create!(name: "Slice Smoked Cheddar", calories: 150)
      @ingredient_2 = Ingredient.create!(name: "2 Slices Sourdough Bread", calories: 200)
      @ingredient_3 = Ingredient.create!(name: "Tbs Butter", calories: 100)
      @ingredient_4 = Ingredient.create!(name: "Pizza Dough", calories: 100)
      @ingredient_5 = Ingredient.create!(name: "Tomato Sauce", calories: 100)



      @dish_ingredient_1 = DishIngredient.create!(dish: @dish, ingredient: @ingredient_1)
      @dish_ingredient_2 = DishIngredient.create!(dish: @dish, ingredient: @ingredient_2)
      @dish_ingredient_3 = DishIngredient.create!(dish: @dish, ingredient: @ingredient_3)
      @dish_ingredient_4 = DishIngredient.create!(dish: @dish2, ingredient: @ingredient_4)
      @dish_ingredient_5 = DishIngredient.create!(dish: @dish2, ingredient: @ingredient_5)

      visit "chefs/#{@chef.id}"
    end

    it "I see the name of that chef" do
      expect(page).to have_content("#{@chef.name}")
    end

    it "And I see a link to view a list of all ingredients that this chef uses in their dishes" do
      expect(page).to have_link("Chef's Ingredients")
    end

    describe "When I click on that link" do


      it "I'm taken to a chef's ingredient index page" do
        click_link "Chef's Ingredients"
        
        expect(current_path).to eq("/chefs/#{@chef.id}/ingredients")
      end

      it "and I can see a unique list of names of all the ingredients that this chef uses" do
        click_link "Chef's Ingredients"

        expect(page).to have_content(@ingredient_1.name)
        expect(page).to have_content(@ingredient_2.name)
        expect(page).to have_content(@ingredient_3.name)
        expect(page).to have_content(@ingredient_4.name)
        expect(page).to have_content(@ingredient_5.name)
      end

    end
  end
end
