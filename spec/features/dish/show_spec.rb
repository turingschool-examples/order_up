require 'rails_helper'

RSpec.describe "Dish Show Page" do
  before :each do
    set_up
  end
  describe "as a visitor" do
    it "displays the dishes name and ingredients" do
      visit "/chefs/#{@chef_a.id}/dishes/#{@dish_1.id}"

      expect(page).to have_content(@dish_1.name)
      expect(page).to have_content(@asparagus.name)
      expect(page).to have_content(@snap_peas.name)
      expect(page).to have_content(@noodles.name)
    end
    it "displays the chef's name" do
      visit "/chefs/#{@chef_a.id}/dishes/#{@dish_1.id}"

      expect(page).to have_content(@chef_a.name)
    end
    it "displays the total calorie count" do
      visit "/chefs/#{@chef_a.id}/dishes/#{@dish_1.id}"

      expect(page).to have_content(@dish_1.calorie_count)
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
