require 'rails_helper'

RSpec.describe DishIngredient, type: :model do
  describe "relationships" do
    it { should belong_to :dish_ingredient }
    it { should belong_to :ngredient }
  end
end
