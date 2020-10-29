require 'rails_helper'

# As a visitor
# When I visit a dish's show page
# I see the dish’s name and description
# And I see a list of ingredients for that dish
# And I see the chef's name

# As a visitor
# When I visit a dish's show page
# I see the total calorie count for that dish.

describe "as a visitor" do
  before :each do
    @chef = Chef.create!(name: "Yevhen Klopotenko")

    @dish = Dish.create!(name: "Borscht",
                        description: "One of the most famous dishes of Ukrainian cuisine, made with beetroots as one of the main ingredients, which give the dish its distinctive red color.",
                        chef_id: @chef.id)

    @ingredient_1 = Ingredient.create!(name: "Beet",
                                      calories: 59)

    @ingredient_2 = Ingredient.create!(name: "Yukon Potato",
                                      calories: 110)

    @ingredient_3 = Ingredient.create!(name: "Carrot",
                                      calories: 25)

    DishIngredient.create!(dish_id: @dish.id,
                           ingredient_id: @ingredient_1.id)

    DishIngredient.create!(dish_id: dish.id,
                           ingredient_id: @ingredient_2.id)

    DishIngredient.create!(dish_id: @dish.id,
                           ingredient_id: @ingredient_3.id)
  end
  describe "when I visit a dish's show page" do
    it "I see the dish’s name and description, a list of ingredients for that dish, and I see the chef's name" do

      visit("/dishes/#{@dish.id}")

      expect(page).to have_content("Name of dish: #{@dish.name}")
      expect(page).to have_content("Description of dish: #{@dish.description}")
      expect(page).to have_content("Chef's Name: #{@chef.name}")

      within("#ingredients") do
        expect(page).to have_content("Ingredients:")
        expect(page).to have_content("#{@ingredient_1.name}")
        expect(page).to have_content("#{@ingredient_2.name}")
        expect(page).to have_content("#{@ingredient_3.name}")
      end
    end

    it "I see the total calorie count for that dish" do
      visit("/dishes/#{@dish.id}")

      expect(page).to have_content("Total Calories: 194")
    end
  end
end
