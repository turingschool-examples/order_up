require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "when I visit the chef's ingredient's index page" do
    before do
      @chef = Chef.create!(name: "Chef Aiden")
      @chicken_alfredo = @chef.dishes.create!(name: "Chicken Alfredo", description: "It's alfredo-y!")
      @chicken = @chicken_alfredo.ingredients.create!(name: "chicken", calories: 400)
      @alfredo_sauce = @chicken_alfredo.ingredients.create!(name: "alfredo sauce", calories: 750)
      
      @pecan_salad = @chef.dishes.create!(name: "Salad", description: "It's green!")
      @lettuce = @pecan_salad.ingredients.create!(name: "lettuce", calories: 20)
      @pecan = @pecan_salad.ingredients.create!(name: "pecans", calories: 120)
    end
    it "lists all the ingredients in all their dishes" do
      visit "/chefs/#{@chef.id}/ingredients"

      expect(page).to have_content(@chicken.name)
      expect(page).to have_content(@alfredo_sauce.name)
      expect(page).to have_content(@lettuce.name)
      expect(page).to have_content(@pecan.name)
    end
  end
end