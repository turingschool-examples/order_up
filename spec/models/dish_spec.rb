require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it { should have_many :dish_ingredients }
    it {should have_many(:ingredients).through(:dish_ingredients)}
  end

  describe 'instance methods' do
    it "returns total calories for the dish" do
      @chef_1 = Chef.create!(name: "Kris Litman")
      @dish_1 = @chef_1.dishes.create!(name: "dank curry", description: "Southern style fish curry")
      @fish = Ingredient.create(name: "fish", calories: 100)
      @broth = Ingredient.create(name: "Chicken broth", calories: 100)
      @potato = Ingredient.create(name: "Potato", calories: 125)
      @dish_1.ingredients << @fish
      @dish_1.ingredients << @broth
      @dish_1.ingredients << @potato

      expect(@dish_1.total_calories).to eq(325)
    end
  end
end
