require 'rails_helper'

  describe IngredientDish do
    describe "relationship" do
      it {should belong_to :dish}
      it {should belong_to :ingredient}
    end
  end
