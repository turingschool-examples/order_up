require 'rails_helper'

RSpec.describe "Ingredients Index" do
  let(:chef) {Chef.create!(name: "Martha Stewart")}
  let!(:ingredient_1) {Ingredient.create(name: "macaroni", calories: 390)}
  let!(:ingredient_2) {Ingredient.create(name: "cheese", calories: 531)}
  let!(:ingredient_3) {Ingredient.create(name: "cream", calories: 28)}
  let!(:ingredient_4) {Ingredient.create(name: "eggplant", calories: 40)}
  let!(:ingredient_5) {Ingredient.create(name: "tomatoes", calories: 32)}
  let!(:ingredient_6) {Ingredient.create(name: "steak", calories: 275)}
  let!(:dish_1) {chef.dishes.create!(name: "Macaroni and Cheese", description: "cheese and pasta", ingredients: [ingredient_1, ingredient_2, ingredient_3])}
  let!(:dish_2) {chef.dishes.create!(name: "Eggplant Casserole", description: "cheesy eggplant casserole", ingredients: [ingredient_2, ingredient_3, ingredient_4, ingredient_5])}

  before(:each) {visit chef_path(chef)}

  describe 'displays' do
    it 'a unique list of ingredients used by the chef' do
      chef.ingredients.each do |ingredient|
        expect(page).to have_content(ingredient.name, count: 1)
      end
      expect(page).not_to have_content(ingredient_6.name)
    end
  end
end
