require 'rails_helper'

RSpec.describe Ingredients, type: :model do
  describe 'relationships' do

  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :calories }
  end
end
