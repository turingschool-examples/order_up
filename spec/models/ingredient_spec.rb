require 'rails_helper'

RSpec.describe DishIngredient, type: :model do
  describe "relationships" do
    it { should have_many :dish_ingredients }
    it { should have_any(:dishes).through(:dish_ingredients) }
  end
end
