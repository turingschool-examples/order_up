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
      @eggs = Ingredient.create(name: "egg", calories: 120)
      @apple = Ingredient.create(name: "apple", calories: 200)
      @potato = Ingredient.create(name: "Potato", calories: 125)
      @dish_1.ingredients << @fish
      @dish_1.ingredients << @broth
      @dish_1.ingredients << @potato
      @dish_1.ingredients << @apple
      @dish_1.ingredients << @eggs
      @dish_2.ingredients << @potato
      @dish_2.ingredients << @fish
      @dish_2.ingredients << @broth
    end

    it "I see the three most popular ingredients that the chef uses in their dishes" do
      visit "/chefs/#{@chef_1.id}"


      expect(page).to have_content("Most popular")
      within ("#most_popular") do
        expect(page).to have_content(@corn.name)
        expect(page).to have_content(@fish.name)
        expect(page).to have_content(@broth.name)
      end
    end
  end
end

#
# Extension
# As a visitor
# When I visit a chef's show page
# I see the three most popular ingredients that the chef uses in their dishes
# (Popularity is based off of how many dishes use that ingredient)
