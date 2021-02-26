require 'rails_helper'


RSpec.describe 'As a visitor' do
  describe "When I visit the chef show page (/chefs/:id)" do
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

    it "shows me the chefs name and has link to ingredients" do
      visit "/chefs/#{@chef_1.id}"

      expect(current_path).to eq("/chefs/#{@chef_1.id}")
      expect(page).to have_content(@chef_1.name)
      expect(page).to have_link("ingredients")
    end

    it "when i click the link i'm take to the (chefs/:id/ingredients) index page" do
      visit "/chefs/#{@chef_1.id}"

      expect(page).to have_link("ingredients")
      click_link("ingredients")
      expect(current_path).to eq("/chefs/#{@chef_1.id}/ingredients")
    end

    it "and I can see a unique list of names of all the ingredients that this chef uses" do
      visit "/chefs/#{@chef_1.id}/ingredients"

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
