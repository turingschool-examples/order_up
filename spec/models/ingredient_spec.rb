require 'rails_helper'

describe Ingredient, type: :model do
  describe "relationships" do
    it { should have_many :dish_ingredients }
    it { should have_many(:dishes).through(:dish_ingredients) }
    it { should have_many(:chefs).through(:dishes) }
  end
end
