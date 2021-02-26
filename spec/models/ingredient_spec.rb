require 'rails_helper'
describe Ingredient, type: :model do
  describe 'Relationships' do
    it {should have_many :dish_ingredients}
    it {should have_many(:dishes).through(:dish_ingredients)}
  end
end