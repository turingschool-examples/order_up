require 'rails_helper' 

RSpec.describe "Chef Ingredient Index" do 
  before(:each) do 
    @chef = Chef.create!(name: "Bourdain")

    @dish1 = Dish.create!(name: "Pasta", description: "Chicken Alfredo", chef_id: @chef.id)
    @dish2 = Dish.create!(name: "Salad", description: "Chicken Salad", chef_id: @chef.id)

    @ingredient1 = Ingredient.create!(name: "Fettucine", calories: 200)
    @ingredient2 = Ingredient.create!(name: "Chicken", calories: 250)
    @ingredient3 = Ingredient.create!(name: "Alfredo", calories: 350)
    @ingredient4 = Ingredient.create!(name: "Lettuce", calories: 100)
    @ingredient5 = Ingredient.create!(name: "Crouton", calories: 150)

    @dish_ing1 = DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @ingredient1.id)
    @dish_ing2 = DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @ingredient2.id)
    @dish_ing3 = DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @ingredient3.id)
    @dish_ing4 = DishIngredient.create!(dish_id: @dish2.id, ingredient_id: @ingredient4.id)
    @dish_ing5 = DishIngredient.create!(dish_id: @dish2.id, ingredient_id: @ingredient5.id)
    @dish_ing6 = DishIngredient.create!(dish_id: @dish2.id, ingredient_id: @ingredient2.id)
  end
  describe "When I visit the Chef's ingredient index page" do 
    it "displays the chef's name and a unique list of ingredients" do 

      visit "/chef/#{@chef.id}/ingredient" do 

        within("#name") do 
          expect(page).to have_content("#{@chef.name}'s Ingredients")
        end

        within("#ingredients") do 
          
          expect(page).to have_content(@ingredient1.name)
          expect(page).to have_content(@ingredient2.name)
          expect(page).to have_content(@ingredient3.name)
          expect(page).to have_content(@ingredient4.name)
          expect(page).to have_content(@ingredient5.name)
        end
      end

    end
  end
end