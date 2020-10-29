require 'rails_helper'

describe "As a visitor" do
  describe "When I visit a chef's show page" do
    it "I see the name of that chef and a link to view
    all ingredients this chef uses in their dishes" do
      chef_steve = Chef.create!(name: "Steve")
      pbj = chef_steve.dishes.create!(name: "PeanutButter Jelly",
                         description: "Most delicious")
      peanutbutter = pbj.ingredients.create!(name: "PeanutButter",
                                             calories: 1337)
      jelly = pbj.ingredients.create!(name: "Jelly",
                                             calories: 9999)
      bread = pbj.ingredients.create!(name: "Bread",
                                             calories: 250)

      visit "/chefs/#{chef_steve.id}"

      expect(page).to have_content(chef_steve.name)
      expect(page).to have_link("All Ingredients Used")
    end 
  end
end
