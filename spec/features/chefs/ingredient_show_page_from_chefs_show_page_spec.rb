require "rails_helper"

RSpec.describe "When I visit a chefs show page" do
  before :each do
    @gordon = Chef.create!(
      name: "Gordon Ramsey"
    )
    @guy = Chef.create!(
      name: "Guy Fieri"
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

      expect(page).to have_content(@gordon.name)
      expect(page).to have_link("View all ingredients #{@gordon.name} uses")
    end
    it "Takes me to ingredient/index with unique list of all ingredients" do

      visit chef_ingredients_path(@gordon.id)
      save_and_open_page

      expect(page).to have_content(@parm.name)
      expect(page).to have_content(@puff_pastry.name)
      expect(page).to have_content(@beef.name)
      expect(page).to have_content(@parm.name)
      expect(page).to have_content(@noodles.name)
      expect(page).to have_content(@sauce.name)
      expect(page).to have_content(@salmon.name)
    end
  end

  describe "When a chef has no dishes" do
    it "See message when trying to view all ingredients with none" do

      visit chef_path(@guy.id)

      click_link "View all ingredients #{@guy.name} uses"
      within(".flash") do
        expect(page).to have_content("This Chef has no Ingredients")
      end
    end
  end
end
