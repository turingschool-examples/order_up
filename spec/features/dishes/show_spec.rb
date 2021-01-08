require 'rails_helper'

RSpec.describe "As a visitor" do
    describe "when i visit a dish's show page" do

        before :each do
            @chef1 = Chef.create(name: "Chef Von Winkle")
            @dish1 = Dish.create(name: "apple pie", description: "see name", chef: @chef1)
            @dish2 = Dish.create(name: "pommes frites", description: "its delicious just eat it", chef: @chef1)
            @ingredient1 = Ingredient.create(name: "pommes", calories: 300)
            @ingredient2 = Ingredient.create(name: "frites", calories: 200)
            @recipe1 = Recipe.create(dish: @dish1, ingredient: @ingredient1)
            @recipe2 = Recipe.create(dish: @dish1, ingredient: @ingredient2)
        end
       
       
        it "I see the dish's name and description" do
            visit "/visitor/#{@dish2.id}"

            expect(page).to have_content("pommes frites")
            expect(page).to have_content("its delicious just eat it")
        end

        it "I see a list of ingredients for that dish" do
            visit "/visitor/#{@dish2.id}"

            expect(page).to have_content(@recipe1)
            expect(page).to have_content(@recipe2)
        end

        it "I see the chef's name" do
            visit "/visitor/#{@dish2.id}"

            expect(page).to have_content(@dish1.chef)
        end

        it "I see the total calorie count for that dish" do
            visit "/visitor/#{@dish2.id}"

            expect(page).to have_content(500)
        end

    end
end