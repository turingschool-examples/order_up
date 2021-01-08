require 'rails_helper'

RSpec.describe "As a visitor" do
    describe "when i visit a chef's show page" do

        before :each do
            @chef1 = Chef.create(name: "Chef Von Winkle")
            @dish1 = Dish.create(name: "apple pie", description: "see name", chef: @chef1)
            @dish2 = Dish.create(name: "pommes frites", description: "its delicious just eat it", chef: @chef1)
            @ingredient1 = Ingredient.create(name: "pommes", calories: 300)
            @ingredient2 = Ingredient.create(name: "frites", calories: 200)
            @recipe1 = Recipe.create(dish: @dish2, ingredient: @ingredient1)
            @recipe2 = Recipe.create(dish: @dish2, ingredient: @ingredient2)
        end
       
       
        it "I see the the name of that chef" do
            visit "/chefs/#{@chef1.id}"

            expect(page).to have_content(@chef1.name)
        end

        it "I see a link to view a list of all ingredients that this chef uses in their dishes" do
            visit "/chefs/#{@chef1.id}"

            expect(page).to have_link("Chef's ingredients")

            click_link("Chef's ingredients")

            expect(current_path).to eq( "/chefs/#{@chef1.id}/ingredients")
        end

        it "I see the three most popular ingredients that the chef uses in their dishes" do
            visit "/chefs/#{@chef1.id}"
        end

    end
end