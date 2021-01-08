require 'rails_helper'

RSpec.describe "As a visitor" do
    describe "when i visit a chef's ingredients index page" do
        before :each do
            @chef1 = Chef.create(name: "Chef Von Winkle")
            @dish1 = Dish.create(name: "apple pie", description: "see name", chef: @chef1)
            @dish2 = Dish.create(name: "pommes frites", description: "its delicious just eat it", chef: @chef1)
            @ingredient1 = Ingredient.create(name: "pommes", calories: 300)
            @ingredient2 = Ingredient.create(name: "frites", calories: 200)
            @recipe1 = Recipe.create(dish: @dish2, ingredient: @ingredient1)
            @recipe2 = Recipe.create(dish: @dish2, ingredient: @ingredient2)
        end

        it "I can see a unique list of names of all the ingredients that this chef uses" do
            visit "/chefs/#{@chef1.id}/ingredients"

            expect(page).to have_content(@ingredient1.name)
            expect(page).to have_content(@ingredient2.name)
        end

    end
end