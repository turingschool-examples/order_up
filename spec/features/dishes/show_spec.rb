require 'rails_helper'

RSpec.describe "Dish Show" do
  describe 'displays' do
    let(:chef) {Chef.create!(name: "Martha Stewart")}
    let!(:dish) {chef.dishes.create!(name: "Macaroni and Cheese", description: "cheese and pasta")}
    let!(:ingredient_1) {Ingredient.create(name: "macaroni", calories: 390)}
    let!(:ingredient_2) {Ingredient.create(name: "cheese", calories: 531)}
    let!(:ingredient_3) {Ingredient.create(name: "cream", calories: 28)}

    it "the dish's attributes" do
      visit dish_path(dish)

      expect(page).to have_content(dish.name)
      expect(page).to have_content(dish.description)
    end

    it "the dish's ingredients" do
      dish.ingredients = [ingredient_1, ingredient_2, ingredient_3]

      visit dish_path(dish)

      within("#ingredients") do
        expect(page).to have_content(ingredient_1.name)
        expect(page).to have_content(ingredient_2.name)
        expect(page).to have_content(ingredient_3.name)
      end
    end

    it "the dish's chef" do
      visit dish_path(dish)

      expect(page).to have_content(chef.name)
    end

    it "the total calorie count" do
      visit dish_path(dish)

      expect(page).to have_content("949")
    end
  end
end
