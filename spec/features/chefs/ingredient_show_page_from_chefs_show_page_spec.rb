require "rails_helper"

RSpec.describe "When I visit a chefs show page" do
  before :each do
    @gordon = Chef.create!(
      name: "Gordon Ramsey"
    )
    @penne = @gordon.dishes.create!(
      name: "Penne Vodka",
      description: "Saucy"
    )
    @wellington = @gordon.dishes.create!(
      name: "Beef Wellington",
      description: "Bloody Brilliant"
    )
    @risotto = @gordon.dishes.create!(
      name: "Seafood Risotto",
      description: "Also Bloody Brilliant"
    )
    @beef = Ingredient.create!(
      name: "Dont forget the lamb sauce",
      calories: 1000
    )
    @puff_pastry = Ingredient.create!(
      name: "Puff Pastry",
      calories: 800
    )
    @noodles = Ingredient.create!(
      name: "Penne",
      calories: 300
    )
    @sauce = Ingredient.create!(
      name: "Sauce",
      calories: 800
    )
    @parm = Ingredient.create!(
      name: "Cheese",
      calories: 400
    )
    @salmon = Ingredient.create!(
      name: "Salmon",
      calories: 500
    )
    @wellington.ingredients << [@parm, @puff_pastry, @beef]
    @penne.ingredients << [@parm, @noodles, @sauce]
    @risotto.ingredients << [@parm, @noodles, @salmon]
  end

  describe "I see the name of the chef" do
    it "Has a link to a list of all ingredients chef uses in all dishes" do

      visit chef_path(@gordon.id)

      expect(page).to have_content
    end
    it "Takes me to ingredient/index with unique list of all ingredients"
  end
end

#   Story 2 - Chef Show Page
#
# As a visitor
# When I visit a chef's show page
# I see the name of that chef
# And I see a link to view a list of all ingredients that this chef uses in their dishes
# When I click on that link
# I'm taken to a chef's ingredient index page
# and I can see a unique list of names of all the ingredients that this chef uses
