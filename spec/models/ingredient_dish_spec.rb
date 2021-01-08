require "rails_helper"
describe IngredientDish, type: :model do
  describe "relations" do
    it {should belong_to :ingredient}
  end
end
