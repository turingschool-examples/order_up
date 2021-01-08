require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "when I visit a dish's show page" do
    before(:each) do
      @chef = Chef.create!(name: "Chef Aiden")
      @chicken_alfredo = @chef.dishes.create!(name: "Chicken Alfredo", description: "It's alfredo-y!")
      @chicken = @chicken_alfredo.ingredients.create!(name: "chicken", calories: 400)
      @alfredo_sauce = @chicken_alfredo.ingredients.create!(name: "alfredo sauce", calories: 750)
    end
    it "I see the dish’s name and description" do
      visit "/dishes/#{@chicken_alfredo.id}"

      expect(page).to have_content(@chicken_alfredo.name)
      expect(page).to have_content(@chicken_alfredo.description)
    end
    it "and I see a list of ingredients for that dish" do
      visit "/dishes/#{@chicken_alfredo.id}"

      expect(page).to have_content(@chicken.name)
      expect(page).to have_content(@alfredo_sauce.name)
    end
    it "and I see the chef's name" do
      visit "/dishes/#{@chicken_alfredo.id}"

      expect(page).to have_content(@chef.name)
    end
  end
end