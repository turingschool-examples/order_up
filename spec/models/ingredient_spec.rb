require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many :recipes }
    it {should have_many(:dishes).through(:recipes)}
  end

  describe 'instance methods' do
  end

  describe 'class methods' do 
  end
  
end