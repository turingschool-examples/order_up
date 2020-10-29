require 'rails_helper'

describe "Dish Show page" do
  describe "As a visitor" do
    before(:each) do
      @elzar = Chef.create!(
        name: 'Elzar'
      )
    end
    describe "When I visit a dish's show page" do
      it "I see the dish's name and description" do

      end
      it "I see a list of ingredients for that dish" do

      end
      it "I see the chef's name" do

      end
    end
  end
end
