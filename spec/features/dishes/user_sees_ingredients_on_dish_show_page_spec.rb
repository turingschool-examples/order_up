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

      visit dish_path(@penne.id)

      expect(page).to have_content(@penne.name)
      expect(page).to have_content(@penne.description)
      expect(page).to have_content(@parm.name)
      expect(page).to have_content(@noodles.name)
      expect(page).to have_content(@sauce.name)
    end

    it "Shows the chef's name" do

      visit dish_path(@penne.id)

      expect(page).to have_content("Cooked by: #{@gordon.name}")
    end

    it "Shows the total calorie count for that dish" do

      visit dish_path(@penne.id)
      save_and_open_page

      expect(page).to have_content("Total calorie count for #{@penne.name}: 1500")
    end
  end
end
