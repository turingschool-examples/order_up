require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'validations' do
    it { should validate_presence_of :ingredient_quantity}
  end

  describe 'relationships' do
    it {should belong_to :dish }
    it {should belong_to :ingredient }
  end

  describe 'instance methods' do
  end

  describe 'class methods' do 
  end
  
end