require 'rails_helper'

describe Ingredient, type: :model do
  describe 'relationships' do
    it do
      should have_many(:dish_ingredients)
      should have_many(:dishes).through(:dish_ingredients)
    end
  end
end
