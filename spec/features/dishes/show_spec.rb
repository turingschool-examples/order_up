require 'rails_helper'

RSpec.describe 'As a visitor' do
  before :each do
    @chef = Chef.create!(name: "Bob")
    @dish_1 = Dish.create!(name: "Pasta", description: 'Good dish', chef_id: @chef.id)
    @dish_2 = Dish.create!(name: "Soup", description: 'Good soup', chef_id: @chef.id)

    @ingredient_1 = @dish_1.ingredients.create!(name: 'onions', calories: 100)
    @ingredient_2 = @dish_1.ingredients.create!(name: 'noodles', calories: 350)
    @ingredient_3 = @dish_1.ingredients.create!(name: 'sauce', calories: 200)
  end

  describe "When I visit a dish's show page" do
    it 'I see the dish’s name and description' do
      visit dish_path(@dish_1)

      within("#dish-#{@dish_1.id}") do
        expect(page).to have_content(@dish_1.name)
        expect(page).to have_content(@dish_1.description)
      end

      expect(page).not_to have_content(@dish_2.name)
      expect(page).not_to have_content(@dish_2.description)
    end

    it 'I see a list of ingredients for that dish' do
      visit dish_path(@dish_1)

      within("#dish-#{@dish_1.id}") do
        expect(page).to have_content(@ingredient_1.name)
        expect(page).to have_content(@ingredient_2.name)
        expect(page).to have_content(@ingredient_3.name)
      end
    end

    it "I see the chef's name" do
      visit dish_path(@dish_1)

      within("#dish-#{@dish_1.id}") do
        expect(page).to have_content(@chef.name)
      end
    end

    it 'I see the total calorie count for that dish.' do
      visit dish_path(@dish_1)

      within("#dish-#{@dish_1.id}") do
        expect(page).to have_content(650)
      end
    end

    it 'I see a button to remove the ingredient next to it' do
      visit dish_path(@dish_1)

      within("#ingredient-#{@ingredient_1.id}") do
        expect(page).to have_button("Remove Ingredient")
      end
    end

    it "I am redirected back to the dish's show page after I click the button" do
      visit dish_path(@dish_1)

      within("#ingredient-#{@ingredient_1.id}") do
        click_button("Remove Ingredient")
      end

      expect(current_path).to eq(dish_path(@dish_1))
    end

    it 'I no longer see the ingredient listed for this dish' do
      visit dish_path(@dish_1)

      within("#ingredient-#{@ingredient_1.id}") do
        click_button("Remove Ingredient")
      end

      within("#dish-#{@dish_1.id}") do
        expect(page).not_to have_content(@ingredient_1.name)
        expect(page).to have_content(@ingredient_2.name)
        expect(page).to have_content(@ingredient_3.name)
      end
    end
  end
end
