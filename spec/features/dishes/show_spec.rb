require 'rails_helper'

RSpec.describe "dish show page" do
  before :each do
    @chef = Chef.create!(name: "Chef1")
    @dish = @chef.dishes.create!(name: "Dish1", description: "Description1")
    @ingredient1 = Ingredient.create!(name: "Ingredient1", calories: 7)
    @ingredient2 = Ingredient.create!(name: "Ingredient2", calories: 3)

    @dish_ingredient1 = DishIngredient.create!(dish: @dish, ingredient: @ingredient1)
    @dish_ingredient2 = DishIngredient.create!(dish: @dish, ingredient: @ingredient2)
  end

  describe "when I visit a dishes show page" do
    it "shows the dishes name and discription" do
      visit "/dishes/#{@dish.id}"

      expect(page).to have_content(@dish.name)
      expect(page).to have_content(@dish.description)
    end

    it "shows a list of ingredients for the dish" do
      visit "/dishes/#{@dish.id}"

      within(".ingredients") do
        expect(page).to have_content(@ingredient1.name)
        expect(page).to have_content(@ingredient2.name)
      end
    end

    it "shows the Chefs name" do
      visit "/dishes/#{@dish.id}"

      expect(page).to have_content("Chef: #{@chef.name}")
    end

    it "shows the total calories for the dish" do
      visit "/dishes/#{@dish.id}"

      expect(page).to have_content("Total calories: 10")
    end

    it "shows a button to remove each ingredient" do
      visit "/dishes/#{@dish.id}"

      within(".ingredients") do
        within("#ingredient_id_#{@ingredient1.id}") do
          expect(page).to have_button("Remove")
        end

        within("#ingredient_id_#{@ingredient2.id}") do
          expect(page).to have_button("Remove")
        end
      end
    end
  end
  describe "when a remove button is clicked" do
    it "removes the item" do
      visit "/dishes/#{@dish.id}"

      within(".ingredients") do
        within("#ingredient_id_#{@ingredient1.id}") do
          click_button("Remove")
        end
      end

      expect(current_path).to eq("/dishes/#{@dish.id}")

      expect(page).to_not have_content(@ingredient1.name)
    end
  end
end
