require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
    it {should have_many(:ingredients).through(:dishes)}
  end

  describe "delegate methods" do
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
    let!(:dish_5) {chef.dishes.create!(name: "Creamy Cheese", description: "creamy cheese", ingredients: [ingredient_2, ingredient_3])}


    it 'top_ingredients' do
      expect(chef.top_ingredients).to eq([ingredient_3, ingredient_2, ingredient_5])
    end

    it 'unique_ingredients' do
      expect(chef.unique_ingredients.to_set).to eq([ingredient_1, ingredient_2, ingredient_3, ingredient_4, ingredient_5].to_set)
    end
  end
end
