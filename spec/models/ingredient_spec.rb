require 'rails_helper'

describe Ingredient do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :calories}
  end

  describe "relationships" do
    it { should have_many :dish_ingredients}
  end
end
