require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe 'relationships' do
    it { should have_many :dish_ingredients }
    it { should have_many(:dishes).through(:dish_ingredients) }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :calories }
  end
end
