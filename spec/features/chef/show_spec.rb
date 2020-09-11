require 'rails_helper'

describe "As a visitor" do
  describe "When I visit a cehf's ingredient index page" do
    describe "I see the name of that chef" do
      describe "And I see a link to view a list of all ingredients that this chef uses in their dishes" do
        describe "When I click on that link" do
          it "I'm taken to a chef's ingredient index page and I can see a unique list of names of all the ingredients that this chef uses" do

            george = Chef.create!(name: "George")

            dish_1 = Dish.create!(name: "Camel meatballs", description: "Succulent camel meat in spaghetti sauce", ingredients: "camel meat, spaghetti sauce, parmesean", calories: "3,455cal", chef_id: george.id)
            dish_2 = Dish.create!(name: "Lasangua", description: "Layers of iguana lasangua", ingredients: "iguana, spaghetti sauce, parmesean, garlic", calories: "3,300cal", chef_id: george.id)

            visit "/chefs/#{george.id}"

            expect(page).to have_content("#{george.name}")
            expect(page).to have_link("See all of #{george.name}'s ingredients")
            click_link("See all of #{george.name}'s ingredients")

            expect(current_path).to eq("/chefs/#{george.id}/ingredients")
            expect(page).to have_content("camel meat")
            expect(page).to have_content("spaghetti sauce")
            expect(page).to have_content("garlic")
            expect(page).to_not have_content("spaghetti sauce").twice
          end

          it "I see the three most popular ingredients" do

            george = Chef.create!(name: "George")

            dish_1 = Dish.create!(name: "Camel meatballs", description: "Succulent camel meat in spaghetti sauce", ingredients: "camel meat, spaghetti sauce, parmesean", calories: "3,455cal", chef_id: george.id)
            dish_2 = Dish.create!(name: "Lasangua", description: "Layers of iguana lasangua", ingredients: "iguana, spaghetti sauce, parmesean, garlic", calories: "3,300cal", chef_id: george.id)

            visit "/chefs/#{george.id}"

            expect(page).to have_content("spaghetti sauce")
            expect(page).to have_content("garlic")
            expect(page).to have_content("parmesean")

          end
        end
      end
    end
  end
end
