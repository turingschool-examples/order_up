require 'rails_helper'

# As a visitor
# When I visit a chef's show page
# I see the name of that chef
# And I see a link to view a list of all ingredients that this chef uses in their dishes
# When I click on that link
# I'm taken to a chef's ingredient index page
# and I can see a unique list of names of all the ingredients that this chef uses

describe "as a visitor" do
  before :each do
    @chef = Chef.create!(name: "Yevhen Klopotenko")

    @dish_1 = Dish.create!(name: "Borscht",
                        description: "One of the most famous dishes of Ukrainian cuisine, made with beetroots as one of the main ingredients, which give the dish its distinctive red color.",
                        chef_id: @chef.id)

    @dish_2 = Dish.create!(name: "Falafel",
                        description: "Falafel is a deep-fried ball or patty made from ground chickpeas, fava beans, or both.",
                        chef_id: @chef.id)

    @ingredient_1 = Ingredient.create!(name: "Beet",
                                      calories: 59)

    @ingredient_2 = Ingredient.create!(name: "Yukon Potato",
                                      calories: 110)

    @ingredient_3 = Ingredient.create!(name: "Carrot",
                                      calories: 25)

    @ingredient_4 = Ingredient.create!(name: "Dried chickpeas",
                                      calories: 269)

    @ingredient_5 = Ingredient.create!(name: "Onion",
                                      calories: 44)

    @ingredient_6 = Ingredient.create!(name: "Carrot",
                                      calories: 25)

    DishIngredient.create!(dish_id: @dish_1.id,
                           ingredient_id: @ingredient_1.id)

    DishIngredient.create!(dish_id: @dish_1.id,
                           ingredient_id: @ingredient_2.id)

    DishIngredient.create!(dish_id: @dish_1.id,
                           ingredient_id: @ingredient_3.id)

    DishIngredient.create!(dish_id: @dish_2.id,
                           ingredient_id: @ingredient_4.id)

    DishIngredient.create!(dish_id: @dish_2.id,
                           ingredient_id: @ingredient_5.id)

    DishIngredient.create!(dish_id: @dish_2.id,
                           ingredient_id: @ingredient_6.id)
  end
  describe "when I visit a chef's show page" do
    it "I see the name of that chef and I see a link to view a list of all ingredients that this chef uses in their dishes" do
      visit("/chefs/#{@chef.id}")

      expect(page).to have_content("Chef: #{@chef.name}")
      expect(page).to have_link("View all ingredients used by chef")
    end
    describe "when I click on that link" do
      it "I'm taken to a chef's ingredient index page and I can see a unique list of names of all the ingredients that this chef uses" do
        visit("/chefs/#{@chef.id}")

        click_link("View all ingredients used by chef")

        expect(current_path).to eq("/chefs/#{@chef.id}/ingredients")

        within("#ingredients") do
          expect(page).to have_content("Ingredients:")
          expect(page).to have_content("#{@ingredient_1.name}")
          expect(page).to have_content("#{@ingredient_2.name}")
          expect(page).to have_content("#{@ingredient_3.name}")
          expect(page).to have_content("#{@ingredient_4.name}")
          expect(page).to have_content("#{@ingredient_5.name}")
        end
      end
    end
  end
end
