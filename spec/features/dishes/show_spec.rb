require "rails_helper"

RSpec.describe "As a visitor", type: :feature do
  describe "When I visit a dish's show page" do
    before(:each) do
      chef = Chef.create(name: "Brisa")

      @dish_1 = Dish.create!(name: "Dish 1", description: "Umami")
      # @dish_2 = Dish.create!(name: "Dish 2", description: "Sweet")
      # @dish_3 = Dish.create!(name: "Dish 3", description: "Spicy")

    end

    it "shows the dish’s name and description" do
      visit dish_path(@dish_1)

      expect(page).to have_content(@dish_1.name)
      expect(page).to have_content(@dish_1.ingredients)
      expect(page).to have_content(@dish_1.chefs_name)
      expect(page).to have_content(@dish_1.total_calories)
    end

    it "list ingredients for that dish" do
    end

    it "And I see the chef's name" do
    end

    it "And I see the total calorie count for that dish." do
    end
