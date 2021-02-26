require 'rails_helper'

RSpec.describe "Chef Show Page" do
  before :each do
    set_up
  end
  describe "as a visitor" do
    it "displays the chefs name" do
      visit "/chefs/#{@chef_a.id}"

      expect(page).to have_content(@chef_a.name)
    end
    it "has a link to all ingredients" do
      visit "/chefs/#{@chef_a.id}"
      click_link("All Ingredients Used")

      expect(current_path).to eq("/chefs/#{@chef_a.id}/ingredients")
    end
   end

  def set_up
    @chef_a = Chef.create!(name: "Assa Paragus")

    @dish_1 = @chef_a.dishes.create!(name: "Asparagus Stirfy", description: "Sizzly!")

    @asparagus = Ingredient.create!(name: "Asparagus", calories: 100)
    @snap_peas = Ingredient.create!(name: "Snap Peas", calories: 100)
    @noodles = Ingredient.create!(name: "Noodles", calories: 500)
    @beef = Ingredient.create!(name: "Beef", calories: 500)

    @chef_a.dishes.find(@dish_1.id).ingredients << @asparagus
    @chef_a.dishes.find(@dish_1.id).ingredients << @snap_peas
    @chef_a.dishes.find(@dish_1.id).ingredients << @noodles
  end
end
