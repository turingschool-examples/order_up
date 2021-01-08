require 'rails_helper'

RSpec.describe "Chef Show" do
  let(:chef) {Chef.create!(name: "Martha Stewart")}
  let!(:ingredient_1) {Ingredient.create(name: "macaroni", calories: 390)}
  let!(:ingredient_2) {Ingredient.create(name: "cheese", calories: 531)}
  let!(:ingredient_3) {Ingredient.create(name: "cream", calories: 28)}
  let!(:ingredient_4) {Ingredient.create(name: "eggplant", calories: 40)}
  let!(:ingredient_5) {Ingredient.create(name: "tomatoes", calories: 32)}
  let!(:ingredient_6) {Ingredient.create(name: "steak", calories: 275)}
  let!(:dish_1) {chef.dishes.create!(name: "Macaroni and Cheese", description: "cheese and pasta", ingredients: [ingredient_1, ingredient_2, ingredient_3])}
  let!(:dish_2) {chef.dishes.create!(name: "Eggplant Casserole", description: "cheesy eggplant casserole", ingredients: [ingredient_2, ingredient_3, ingredient_4, ingredient_5])}
  let!(:dish_3) {chef.dishes.create!(name: "Tomato Soup", description: "creamy tomato soup", ingredients: [ingredient_3, ingredient_5])}

  before(:each) {visit chef_path(chef)}

  describe 'displays' do
    it "the chef's name" do
      expect(page).to have_content(chef.name)
    end

    it "a link to view a list of all ingredients they use" do
      expect(page).to have_link("Ingredients", href: chef_ingredients_path(chef))
    end

    it "the chef's three most popular ingredients" do
      within("#top_ingredients") do
        expect(page).to have_content(ingredient_2.name)
        expect(page).to have_content(ingredient_3.name)
        expect(page).to have_content(ingredient_5.name)
      end

      expect(page).not_to have_content(ingredient_1.name)
      expect(page).not_to have_content(ingredient_4.name)
      expect(page).not_to have_content(ingredient_6.name)
    end
  end
end
