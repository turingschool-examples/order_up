require 'rails_helper'

describe Ingredient, type: :model do
  describe 'relationships' do
    it { should have_many(:dish_ingredients }
  end
end
