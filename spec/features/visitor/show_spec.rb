require 'rails_helper'

describe "As a visitor" do
  describe "When I visit a dish's show page" do
    describe "I see the dish's name and description" do
      describe "And I see a list of ingredients for that dish" do
        it "And I see the chef's name" do

          george = Chef.create!(name: "George")

          dish_1 = Dish.create!(name: "Camel meatballs", description: "Succulent camel meat in spaghetti sauce", ingredients: "camel meat, spaghetti sauce, parmesean", calories: "3,455cal", chef_id: george.id)
          visit "/dishes/#{dish_1.id}"

          expect(page).to have_content("#{dish_1.name}")
          expect(page).to have_content("#{dish_1.description}")
          expect(page).to have_content("#{dish_1.ingredients}")
          expect(page).to have_content("#{george.name}")
          expect(page).to have_content("#{dish_1.calories}")
        end
      end
    end
  end
end
