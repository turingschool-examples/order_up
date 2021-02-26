require 'rails_helper'


RSpec.describe 'As a visitor' do
  describe "I can delete an ingredient from the ingredient show page" do
    before(:each) do
      @chef_1 = Chef.create!(name: "Kris Litman")
      @dish_1 = @chef_1.dishes.create!(name: "dank curry", description: "Southern style fish curry")
      @dish_2 = @chef_1.dishes.create!(name: "pazole", description: "sabores de las mayas")
      @fish = Ingredient.create(name: "fish", calories: 100)
      @broth = Ingredient.create(name: "Chicken broth", calories: 100)
      @potato = Ingredient.create(name: "Potato", calories: 125)
      @dish_1.ingredients << @fish
      @dish_1.ingredients << @broth
      @dish_1.ingredients << @potato
    end

    it "Next to each ingredient I see a button to remove the ingredient" do
        visit "/dishes/#{@dish_1.id}"

        expect(current_path).to eq("/dishes/#{@dish_1.id}")

        expect(page).to have_content(@dish_1.name)
        expect(page).to have_content(@dish_1.chef.name)
        expect(page).to have_content(@dish_1.description)
        expect(page).to have_content(@dish_1.total_calories)

        within("#ingredient-#{@fish.id}") do
          expect(page).to have_content(@fish.name)
          expect(page).to have_button("remove ingredient")
        end
        within("#ingredient-#{@broth.id}") do
          expect(page).to have_button("remove ingredient")
          expect(page).to have_content(@broth.name)
        end
        save_and_open_page
      end
    it "when i click the button I am redirected back to the dish's show page" do
        visit "/dishes/#{@dish_1.id}"


        expect(page).to have_content(@dish_1.name)
        expect(page).to have_content(@dish_1.chef.name)
        expect(page).to have_content(@dish_1.description)
        expect(page).to have_content(@dish_1.total_calories)

        within("#ingredient-#{@fish.id}") do
          expect(page).to have_content(@fish.name)
          expect(page).to have_button("remove ingredient")
          click_button
        end
        expect(current_path).to eq("/dishes/#{@dish_1.id}")
        expect(page).to have_content(@dish_1.name)
      end
    end
  end


# Story 3 - Remove an Ingredient from a Dish
#
# As a visitor
# When I visit a dish's show page
# Next to each ingredient I see a button to remove the ingredient
# When I click the button
# I am redirected back to the dish's show page
# And I no longer see the ingredient listed for this dish
#
# (Note: you should not delete the ingredient record entirely)
