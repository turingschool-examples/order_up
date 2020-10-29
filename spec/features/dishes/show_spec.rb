require 'rails_helper'

describe "As a visitor" do
  describe "When I visit a dish's show page" do
    it "I see the dish's name and description" do
      chef_steve = Chef.create!(name: "Steve")
      pbj = chef_steve.dishes.create!(name: "PeanutButter Jelly",
                         description: "Most delicious")
      peanutbutter = pbj.ingredients.create!(name: "PeanutButter",
                                             calories: 1337)
      jelly = pbj.ingredients.create!(name: "Jelly",
                                             calories: 9999)
      bread = pbj.ingredients.create!(name: "Bread",
                                             calories: 250)

      visit "/dishes/#{pbj.id}"

      expect(page).to have_content(pbj.name)
      expect(page).to have_content(pbj.description)
      expect(page).to have_content("PeanutButter")
      expect(page).to have_content("Jelly")
      expect(page).to have_content("Bread")
      expect(page).to have_content(pbj.chef.name)
    end
  end

  describe "When I visit a dish's show page" do
    it "I see the total calorie count for that dish" do
      chef_steve = Chef.create!(name: "Steve")
      pbj = chef_steve.dishes.create!(name: "PeanutButter Jelly",
                         description: "Most delicious")
      peanutbutter = pbj.ingredients.create!(name: "PeanutButter",
                                             calories: 1337)
      jelly = pbj.ingredients.create!(name: "Jelly",
                                             calories: 9999)
      bread = pbj.ingredients.create!(name: "Bread",
                                             calories: 250)

      visit "/dishes/#{pbj.id}"

      expect(page).to have_content(pbj.total_calories)
    end
  end
end
