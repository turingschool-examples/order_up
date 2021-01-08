require 'rails_helper'

RSpec.describe "As a visitor" do
    describe "when i visit a dish's show page" do

        before :each do
            @chef1 = Chef.create(name: "Chef Von Winkle")
            @dish1 = Dish.create(name: "apple pie", description: "see name", chef: @chef1)
            @dish2 = Dish.create(name: "pommes frites", description: "its delicious just eat it", chef: @chef1)
            @ingredient1 = Ingredient.create(name: "pommes", calories: 300)
            @ingredient2 = Ingredient.create(name: "frites", calories: 200)
            @recipe1 = Recipe.create(dish: @dish2, ingredient: @ingredient1)
            @recipe2 = Recipe.create(dish: @dish2, ingredient: @ingredient2)
        end
       
       
        it "I see the dish's name and description" do
            visit "/dishes/#{@dish2.id}"

            expect(page).to have_content("pommes frites")
            expect(page).to have_content("its delicious just eat it")
        end

        it "I see a list of ingredients for that dish" do
            visit "/dishes/#{@dish2.id}"

            expect(page).to have_content(@ingredient1.name)
            expect(page).to have_content(@ingredient2.name)
        end

        it "I see the chef's name" do
            visit "/dishes/#{@dish2.id}"

            expect(page).to have_content(@chef1.name)
        end

        it "I see the total calorie count for that dish" do
            visit "/dishes/#{@dish2.id}"

            expect(page).to have_content(500)
        end

    end
end