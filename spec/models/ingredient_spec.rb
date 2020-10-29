require "rails_helper"

describe Ingredient, type: :model do
  describe "relationships" do
    it { should have_many(:dishes).through(:recipes) }
    it { should have_many :recipes}
  end
end
