require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe "Relationships" do
    it { should have_many :recipes }
    it { should have_many(:dishes).through(:recipes) }
  end
end
