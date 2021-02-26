require 'rails_helper'

RSpec.describe DishIngredient, type: :model do
  describe "relationships" do
    it {should belong_to :dish}
    it {should belong_to :ingredient}
  end

  describe 'validations' do
    it {should validate_presence_of :count}
  end
end
