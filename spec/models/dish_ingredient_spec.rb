require 'rails_helper'

RSpec.describe DishIngredient do
  describe 'relationships' do
    it {should belong_to :ingredient}
    it {should belong_to :dish}
  end
end
