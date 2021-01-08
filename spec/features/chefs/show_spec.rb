require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "When I visit a chef's show page" do
    before(:each) do
      @chef = Chef.create!(name: "Chef Aiden")
      @chicken_alfredo = @chef.dishes.create!(name: "Chicken Alfredo", description: "It's alfredo-y!")
      @chicken = @chicken_alfredo.ingredients.create!(name: "chicken", calories: 400)
      @alfredo_sauce = @chicken_alfredo.ingredients.create!(name: "alfredo sauce", calories: 750)
    end
    it "I see the name of that chef" do
      visit "/chefs/#{@chef.id}"

      expect(page).to have_content(@chef.name)
    end
    it "And I see a link to view a list of all ingredients that this chef uses in their dishes" do 
      visit "/chefs/#{@chef.id}"
      expect(page).to have_link("View #{@chef.name}'s ingredients")
    end
    it "When I click on that link I'm taken to a chef's ingredient index page" do
      visit "/chefs/#{@chef.id}"
      
      click_on("View #{@chef.name}'s ingredients")
      expect(current_path).to eq("/chefs/#{@chef.id}/ingredients")
    end
  end
end

#  and I can see a unique list of names of all the ingredients that this chef uses