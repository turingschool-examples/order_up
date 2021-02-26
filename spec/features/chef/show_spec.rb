require 'rails_helper'

RSpec.describe 'chefs show page' do
    before(:each) do
      @chef = Chef.create(name: "Bobby Flay")
      @dish_1 = @chef.dishes.create(name: "Cheese Burger", description: "Delicious")
      @cheese = @dish_1.ingredients.create(name: "American cheese", calories: 100)
      @beef = @dish_1.ingredients.create(name: "beef", calories: 200)
      @dish_2 = @chef.dishes.create(name:"Backyard BBQ", description: "Delicious")
      @chicken = @dish_1.ingredients.create(name: "Chicken", calories: 100)
      @bbq_sauce = @dish_1.ingredients.create(name: "bbq sauce", calories: 200)
    end

    describe "can show me the name of that chef" do
      it "has link that brings me to a list of all ingredients" do
      visit chef_path(@chef)
      expect(page).to have_content(@chef.name)
      expect(page).to have_link("Chefs Ingredients")
      click_link("Chefs Ingredients")
      expect(page).to have_content(@cheese.name)
      expect(page).to have_content(@beef.name)
      expect(page).to have_content(@chicken.name)
      expect(page).to have_content(@bbq_sauce.name)
    end
  end
end
