require 'rails_helper'

RSpec.describe "Dish Show page" do 
  before(:each) do 
    @chef = Chef.create!(name: "Bourdain")

    @dish = Dish.create!(name: "Pasta", description: "Chicken Alfredo", chef_id: @chef.id)

    @ingredient1 = Ingredient.create!(name: "Fettucine", calories: 200)
    @ingredient2 = Ingredient.create!(name: "Chicken", calories: 250)
    @ingredient3 = Ingredient.create!(name: "Chicken", calories: 350)

    @dish_ing1 = DishIngredient.create!(dish_id: @dish.id, ingredient_id: @ingredient1.id)
    @dish_ing2 = DishIngredient.create!(dish_id: @dish.id, ingredient_id: @ingredient2.id)
    @dish_ing3 = DishIngredient.create!(dish_id: @dish.id, ingredient_id: @ingredient3.id)
  end
  describe "When I visit the dish show page" do 
    it "it shows the dishs name and description" do 
      visit "/dish/#{@dish.id}"

       expect(current_path).to eq("/dish/#{@dish.id}")

       within("#name") do 
        expect(page).to have_content("Dish Name: #{@dish.name}")
       end

     within("#description") do 
          expect(page).to have_content("Dish Description: #{@dish.description}")
     end
     

    end
  end

end