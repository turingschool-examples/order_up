require 'rails_helper'

RSpec.describe Ingredient do
  describe 'relationships' do
    it {should have_many :dishes}
    it {should have_many(:dishes).through(:dish_ingredients)}
  end

  describe 'class methods' do
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
    let!(:dish_4) {chef.dishes.create!(name: "Milk Steak", description: "milk steak", ingredients: [ingredient_3, ingredient_6])}

    it 'top_ingredients' do
      expect(Ingredient.top_ingredients.to_set).to eq([ingredient_3, ingredient_2, ingredient_5].to_set)
    end

    it '.total_calories' do
      expect(Ingredient.total_calories).to eq(1296)
    end
  end
end
