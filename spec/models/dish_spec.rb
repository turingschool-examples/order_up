require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
  end
  describe "relationships" do
    it { should belong_to :chef }
    it { should have_many :dish_ingredients }
    it { should have_many(:ingredients).through(:dish_ingredients) }
  end

  describe "instance methods" do
    before(:each) do
      @chef = Chef.create!(name: "Claire Saffitz")
      @dish_1 = @chef.dishes.create!(name: "Soft & Crispy Focaccia", description: "Lots of olive oil.")
      @flour = @dish_1.ingredients.create!(name: "Flour", calories: 500)
      @yeast = @dish_1.ingredients.create!(name: "Yeast", calories: 0)
      @salt = @dish_1.ingredients.create!(name: "Salt", calories: 10)
      @evoo = @dish_1.ingredients.create!(name: "Olive Oil", calories: 250)
    end

    it '#total_calories' do
      expected = @dish_1.ingredients.sum { |ingredient| ingredient.calories }
      expect(@dish_1.total_calories).to eq(expected)
    end
  end
end
