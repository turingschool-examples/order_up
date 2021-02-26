require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe "When I visit the dishes show page (/dishes/:id)" do
    before(:each) do
      @chef_1 = Chef.create!(name: "Kris Litman")
      @dish_1 = @chef_1.dishes.create!(name: "dank curry", description: "Southern style fish curry")
      @dish_2 = @chef_1.dishes.create!(name: "pazole", description: "sabores de las mayas")
      @corn = Ingredient.create(name: "corn", calories: 50)
      @fish = Ingredient.create(name: "fish", calories: 100)
      @broth = Ingredient.create(name: "Chicken broth", calories: 100)
      @potato = Ingredient.create(name: "Potato", calories: 125)
      @dish_1.ingredients << @fish
      @dish_1.ingredients << @broth
      @dish_1.ingredients << @potato
    end

    it "shows me the dish name, description, list of ingredients, chef, and total calories" do
      visit "/dishes/#{@dish_1.id}"

      expect(current_path).to eq("/dishes/#{@dish_1.id}")
      expect(page).to have_content(@dish_1.name)
      expect(page).to have_content(@dish_1.chef.name)
      expect(page).to have_content(@dish_1.description)
      expect(page).to have_content(@dish_1.total_calories)

      within("#ingredient-#{@fish.id}") do
        expect(page).to have_content(@fish.name)
        expect(page).to have_content(@fish.calories)
      end
      within("#ingredient-#{@broth.id}") do
        expect(page).to have_content(@broth.name)
        expect(page).to have_content(@broth.calories)
      end
    end
  end
end
