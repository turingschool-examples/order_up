require 'rails_helper'

describe DishIngredient, type: :model do
  describe 'relationships' do
    it do
      should have_one :dish
      should have_one :ingredient
    end
  end
end
