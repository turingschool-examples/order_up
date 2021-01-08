require 'rails_helper'

describe Ingredient do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_numericality_of(:calories).is_greater_than(0) }
  end
  describe 'relationships' do
    it { should have_many :dish_ingredients }
    it { should have_many(:dishes).through(:dish_ingredients) }
  end
end