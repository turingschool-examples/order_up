require 'rails_helper'

describe "As a visitor" do
  describe "When I visit a chef's show page" do
    before(:each) do
      @chef = Chef.create!({name: 'Matty Meatballs'})
    end
    it "I see the name of that chef and a link to view a list of all
        ingredients this chef uses in their dishes" do
      visit "/chefs/#{@chef.id}"

      expect(page).to have_content("#{@chef.name}")
      expect(page).to have_link("This Chef's Favorite Ingredients")
    end

    it "When I click that link I am taken to the chef's ingredient index page" do
      visit "/chefs/#{@chef.id}"

      click_link "This Chef's Favorite Ingredients"
      expect(current_path).to eq("/chefs/#{@chef.id}/ingredients")
    end
  end
end