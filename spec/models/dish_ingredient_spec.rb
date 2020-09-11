require 'rails_helper'

describe DishIngredient do
  describe "relationships" do
    it { should belong_to :dish}
    it { should belong_to :ingredient}
  end
end
