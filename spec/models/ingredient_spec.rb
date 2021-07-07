require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe 'relationships' do
    it {should have_many :meals}
    it {should have_many(:dishes).through(:meals)}
    it {should belong_to :chef }
  end
end
