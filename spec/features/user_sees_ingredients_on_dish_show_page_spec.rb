require "rails_helper"

RSpec.describe "When I visit a dish's show page" do
  before :each do
    @gordon = Chef.create!(
      name: "Gordon Ramsey"
    )
    @penne = @gordon.dishes.create!(
      name: "Penne Vodka",
      description: "Saucy"
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
    @penne.ingredients << [@parm, @noodles, @sauce]
  end

  describe "I see the dish's name & description" do
    it "Has a list of ingredients for that dish" do
    end

    it "Shows the chef's name"
    it "Shows the total calorie count for that dish"
  end
end
