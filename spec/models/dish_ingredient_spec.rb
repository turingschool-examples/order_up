require 'rails_helper'

RSpec.describe DishIngredient, type: :model do
  describe "relationships" do
    it {should validate_presence_of :dish}
    it {should validate_presence_of :ingredient}
  end
end
