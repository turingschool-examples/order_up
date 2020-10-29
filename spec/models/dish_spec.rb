require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end

  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :dish_ingredients}
    it {should have_many(:ingredients).through(:dish_ingredients)}
  end

  describe "instance methods" do
    before (:each) do
      @chef = Chef.create!(name: 'Ed')
      @dish = Dish.create!(name: 'Soup', description: 'Nice and hearty', chef: @chef)
      @lentils = @dish.ingredients.create!(name: 'Lentils', calories: 150)
      @potatoes = @dish.ingredients.create!(name: 'Potatoes', calories: 100)
    end

    it '#calories' do
      expect(@dish.calories).to eq(250)
    end
  end
end
