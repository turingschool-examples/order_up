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
    it "#total_calories" do
      @gordon = Chef.create!(
        name: "Gordon Ramsey"
      )
      @wellington = @gordon.dishes.create!(
        name: "Beef Wellington",
        description: "Bloody Brilliant"
      )
      @beef = Ingredient.create!(
        name: "Dont forget the lamb sauce",
        calories: 1000
      )
      @puff_pastry = Ingredient.create!(
        name: "Puff Pastry",
        calories: 800
      )
      @wellington.ingredients << [@beef, @puff_pastry]

      expect(@wellington.total_calories).to eq 1800
    end
  end
end
