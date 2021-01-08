require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many(:ingredients).through(:dish_ingredients)}
  end

  describe 'instance methods' do
    let(:chef) {Chef.create!(name: "Martha Stewart")}
    let!(:dish) {chef.dishes.create!(name: "Macaroni and Cheese", description: "cheese and pasta")}
    let!(:ingredient_1) {Ingredient.create(name: "macaroni", calories: 390)}
    let!(:ingredient_2) {Ingredient.create(name: "cheese", calories: 531)}
    let!(:ingredient_3) {Ingredient.create(name: "cream", calories: 28)}

    it '#total_calories' do
      dish.ingredients = [ingredient_1, ingredient_2, ingredient_3]

      expect(dish.total_calories).to eq(949)
    end
  end
end
