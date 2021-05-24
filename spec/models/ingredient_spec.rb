require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :calories}
    it {should validate_numericality_of(:calories).is_greater_than_or_equal_to(0)}
  end

  describe "relationships" do
    it {should have_many(:dish_ingredients)}
    it {should have_many(:dishes).through(:dish_ingredients)}
    it {should have_many(:chefs).through(:dishes)}
  end
end
