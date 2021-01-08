require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :ingredients_lists}
    it {should have_many(:ingredients).through(:ingredients_lists)}
  end

  describe 'methods' do
    before :each do
      @gusteau = Chef.create!(name: "Gusteau")
      @pbsquid = @gusteau.dishes.create!(name: "Squid Dressed with Peanut Butter", description: "It's so bad it's laughable")
      @squid = Ingredient.create!(name: "A Whole Squid", calories: 103)
      @pb = Ingredient.create!(name: "Smooth Peanut Butter", calories: 16)
      IngredientsList.create!(dish_id: @pbsquid.id, ingredient_id: @pb.id)
      IngredientsList.create!(dish_id: @pbsquid.id, ingredient_id: @squid.id)
    end

    it 'finds the name of the creator' do
      expect(@pbsquid.creator).to eq(@gusteau.name)
    end

    it 'finds the total calories of a dish' do
      expect(@pbsquid.total_calories).to eq(119)
    end
  end
end
