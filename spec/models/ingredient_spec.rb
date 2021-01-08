require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe "relationships" do
    it {should have_many :components}
    it {should have_many(:dishes).through(:components)}
  end
end