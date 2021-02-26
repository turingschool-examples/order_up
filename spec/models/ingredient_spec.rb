require 'rails_helper'

RSpec.describe Ingredient do
  describe 'relationships' do
    it { should have_many :ingredient_dishes }
  end
end
