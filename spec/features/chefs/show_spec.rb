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

    it "When I click on 'All Ingredients Used' I see a list
    of all ingredients this chef uses" do
      chef_steve = Chef.create!(name: "Steve")
      pbj = chef_steve.dishes.create!(name: "PeanutButter Jelly",
                         description: "Most delicious")
      peanutbutter = pbj.ingredients.create!(name: "PeanutButter",
                                             calories: 1337)
      jelly = pbj.ingredients.create!(name: "Jelly",
                                             calories: 9999)
      bread = pbj.ingredients.create!(name: "Bread",
                                             calories: 250)
      ham_sammy = chef_steve.dishes.create!(name: "Ham Sammy",
                         description: "Most delicious")
      ham = ham_sammy.ingredients.create!(name: "Ham",
                                             calories: 1337)
      cheese = ham_sammy.ingredients.create!(name: "Cheese",
                                             calories: 9999)
      bread = ham_sammy.ingredients.create!(name: "Bread",
                                             calories: 250)

      visit "/chefs/#{chef_steve.id}"
      click_link "All Ingredients Used"
save_and_open_page
      expect(current_path).to eq("/chefs/#{chef_steve.id}/ingredients")
      expect(page).to have_content("PeanutButter")
      expect(page).to have_content("Jelly")
      expect(page).to have_content("Bread")
    end
  end
end
