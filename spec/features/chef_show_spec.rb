require "rails_helper"

RSpec.describe "Chef Show Page" do
  describe "When I visit the chef's show page" do
    it "I see the name of that chef and a link to view a list of all ingredients that chef uses in their dishes" do
      chef1 = Chef.create(name:"Bob")
      chef2 = Chef.create(name:"Alex")
      dish1 = chef1.dishes.create(name: 'Spaghetti and Meatballs', description: "An Italian classic")
      dish2 = chef2.dishes.create(name: 'Fish and Chips', description: "A pub favorite")
      ingredient1 = dish1.ingredients.create(name: 'pasta', calories: 250)
      ingredient2 = dish1.ingredients.create(name: 'marinara sauce', calories: 100)
      ingredient3 = dish1.ingredients.create(name: 'meatballs', calories: 700)
      ingredient4 = dish2.ingredients.create(name: ' fried whitefish', calories: 600)
      ingredient5 = dish2.ingredients.create(name: 'potato chips', calories: 400)

      visit "/chefs/#{chef1.id}"

      within("#chef-#{chef1.id}") do
        expect(page).to have_content(chef1.name)
        expect(page).to have_link("Ingredients List")
      end

      click_link("Ingredients List")

      expect(current_path).to eq("/chefs/#{chef1.id}/ingredients")

      within("#chef-#{chef1.id}-ingredients") do
        expect(page).to have_content(ingredient1.name)
        expect(page).to have_content(ingredient2.name)
        expect(page).to have_content(ingredient3.name)
      end
    end
  end
end
