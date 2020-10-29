require 'rails_helper'

describe "As a visitor" do
  describe "When I visit a chef's show page" do
    it "I see the name of that chef and a link to view a list of all
        ingredients this chef uses in their dishes" do
        @chef = Chef.create!({name: 'Matty Meatballs'})

      visit "/chefs/#{@chef.id}"

      expect(page).to have_content("#{@chef.name}")
      expect(page).to have_link("This Chef's Favorite Ingredients")
    end
  end
end