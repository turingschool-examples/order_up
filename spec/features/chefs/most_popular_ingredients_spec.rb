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
    @wellington.ingredients << [@parm, @puff_pastry, @beef, @sauce]
    @penne.ingredients << [@parm, @noodles, @sauce]
    @risotto.ingredients << [@parm, @noodles, @salmon]
  end

  describe "I see three most popular ingredients chef uses in dishes" do
    it "Based off how many dishes use that ingredient" do

      visit chef_ingredients_path(@gordon.id)

      within(".most_popular_ingredients") do
        expect(page).to have_content(@parm.name)
        expect(page).to have_content(@noodles.name)
        expect(page).to have_content(@sauce.name)
      end
    end
  end
end
