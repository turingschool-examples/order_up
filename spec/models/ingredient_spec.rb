require "rails_helper"

RSpec.describe Ingredient, type: :model do
  describe "associations" do
    it { should have_many :dish_ingredients }
    it { should have_many(:dishes).through(:dish_ingredients) }
  end
end
