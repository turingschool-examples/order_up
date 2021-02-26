require 'rails_helper'

RSpec.describe "Chef Show Page" do
  before(:each) do
    @chef = Chef.create(name: "Chef")

    @mac_cheese = @chef.dishes.create(name: "Mac and Cheese", description: "Cheesy Goodness")
    @pizza = @chef.dishes.create(name: "Pizza", description: "Even when its bad its good")

    @mac = Ingredient.create(name: "Mac", calories: 100)
    @cheese = Ingredient.create(name: "Cheese", calories: 150)
    @dough = Ingredient.create(name: "Pizza Dough", calories: 200)
    @sauce = Ingredient.create(name: "Pizza Sauce", calories: 50)

    @chicken = Ingredient.create(name: "Chicken", calories: 100)

    @mac_cheese.ingredients << [@mac, @cheese]
    @pizza.ingredients << [@dough, @cheese, @sauce]
  end

  describe "As a visitor" do
    it "shows the name of that chef" do
      visit chef_path(@chef)
      
      expect(page).to have_content(@chef.name)
    end
    
    it "shows a link to view a list of all ingredients that this chef uses in their dishes" do
      visit chef_path(@chef)
      
      expect(page).to have_link("#{@chef.name}'s Ingredient List")
    end
    
    describe "When I click on that link" do
      it "takes me to the chef's ingredient index page" do
        visit chef_path(@chef)
        
        click_link("#{@chef.name}'s Ingredient List")
        expect(current_path).to eq(chef_ingredients_path(@chef))
      end
    end
    it "shows a unique list of names of all the ingredients that this chef uses" do
      visit chef_path(@chef)
      
      click_link("#{@chef.name}'s Ingredient List")
      
      expect(page).to have_content(@cheese.name, count: 1)

      within("#ingredient-#{@mac.id}") do
        expect(page).to have_content(@mac.name)
      end

      within("#ingredient-#{@cheese.id}") do
        expect(page).to have_content(@cheese.name)
      end

      within("#ingredient-#{@dough.id}") do
        expect(page).to have_content(@dough.name)
      end

      within("#ingredient-#{@sauce.id}") do
        expect(page).to have_content(@sauce.name)
      end
    end
  end

end