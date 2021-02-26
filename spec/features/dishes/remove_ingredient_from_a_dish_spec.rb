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
    @seafood_ravioli = @gordon.dishes.create!(
      name: "Seafood Ravioli",
      description: "Is this store bought??"
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
    @seafood_ravioli.ingredients << [@noodles, @sauce]
  end

  describe "Next to each ingredient theres a button to remove it" do
    it "Redirected to dish's show page after clicking" do

      visit dish_path(@penne.id)

      within("#ingredient-#{@parm.id}") do
        expect(page).to have_button("Remove")
        click_button "Remove"
      end

      expect(current_path).to eq(dish_path(@penne.id))
    end
    it "No longer shows the dish, but dish record not deleted entirely" do

      visit dish_path(@penne.id)

      within("#ingredient-#{@parm.id}") do
        expect(page).to have_button("Remove")
        click_button "Remove"
      end

      expect(page).not_to have_content(@parm.name)

      visit dish_path(@risotto.id)

      expect(page).to have_content(@parm.name)
    end
    it "Shows error if dish has no ingredients left" do

      visit dish_path(@seafood_ravioli.id)

      within("#ingredient-#{@noodles.id}") do
        expect(page).to have_button("Remove")
        click_button "Remove"
      end

      within("#ingredient-#{@sauce.id}") do
        expect(page).to have_button("Remove")
        click_button "Remove"
      end

      within(".flash") do
        expect(page).to have_content("Notice: Dish has no ingredients")
      end
    end
  end
end
