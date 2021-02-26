require 'rails_helper'

RSpec.describe "Chef Show Page" do
  before :each do
    @chef1 = Chef.create!(name: "Peter")
    @dish1 = @chef1.dishes.create!(name: "Mac n Cheese", description: "Delicious!, but high in calories")
    @ingredient1 = @dish1.ingredients.create!(name: "Elbow Pasta", calories: 80)
    @ingredient2 = @dish1.ingredients.create!(name: "Cheddar Cheese", calories: 180)
    @ingredient3 = @dish1.ingredients.create!(name: "Butter", calories: 150)
    @dish2 = @chef1.dishes.create!(name: "Cheese Pizza", description: "Best Pizza in town")
    @ingredient4 = @dish2.ingredients.create!(name: "Dough", calories: 120)
    @ingredient5 = @dish2.ingredients.create!(name: "Mozzarella Cheese", calories: 160)
    @ingredient6 = @dish2.ingredients.create!(name: "Pizza Sauce", calories: 100)
    @chef2 = Chef.create!(name: "Gordon Ramsey")
  end
  describe "When I visit a chef's show page" do
    it "I see the name of that chef" do
      visit "/chefs/#{@chef1.id}"
        within "#chef-info" do
          expect(page).to have_content(@chef1.name)
          expect(page).to_not have_content(@chef2.name)
        end
    end
    it "And I see a link to view a list of all ingredients that this chef uses in their dishes" do
      visit "/chefs/#{@chef1.id}"
        within "#chef-ingredients-link" do
          expect(page).to have_link("Ingredients used in Recipes")
          click_link("Ingredients used in Recipes")
          expect(current_path).to eq("/chefs/#{@chef1.id}/ingredients")
        end
        within "#ingredients" do
          expect(page).to have_content(@ingredient1.name)
          expect(page).to have_content(@ingredient2.name)
          expect(page).to have_content(@ingredient3.name)
          expect(page).to have_content(@ingredient4.name)
          expect(page).to have_content(@ingredient5.name)
          expect(page).to have_content(@ingredient6.name)
        end
    end
  end
end