require 'rails_helper'

describe Ingredient, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :calories }
  end
  describe "relationships" do

  end
end
