require 'rails_helper'

describe Ingredient, type: :model do
  describe "relations" do
    it {should have_many :ingredient_dishes}
    it {should have_many(:dishes).through(:ingredient_dishes)}
  end
end
