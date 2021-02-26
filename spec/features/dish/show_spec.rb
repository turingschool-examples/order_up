require 'rails_helper'

RSpec.describe "Dish Show Page" do
  before :each do
    set_up
  end
  describe "as a visitor" do
    it "displays the dishes information" do
      visit "/chefs/:chef_id/dishes/#{@dish_1.id}"

      expect(page).to have_content(@dish_1.name)
      expect(page).to have_content(@dish_1.ingredients.pluck(:name))
    end
  end

  def set_up
    @chef_a = Chef.create!(name: "Assa Paragus")

    @dish_1 = @chef_a.dishes.create!(name: "Asparagus Stirfy", description: "Sizzly!")

    @asparagus = Ingredient.create!(name: "Asparagus")
    @snap_peas = Ingredient.create!(name: "Snap Peas")
    @noodles = Ingredient.create!(name: "Noodles")
    @beef = Ingredient.create!(name: "Beef")

    @chef_a.dishes.find(@dish_1.id).ingredients << @asparagus
    @chef_a.dishes.find(@dish_1.id).ingredients << @snap_peas
    @chef_a.dishes.find(@dish_1.id).ingredients << @noodles
  end
end
