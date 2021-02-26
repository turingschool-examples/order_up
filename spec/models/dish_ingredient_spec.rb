require 'rails_helper'

RSpec.describe DishIngredient, type: :model do
  describe "relationships" do
    it {should belong_to :dish}
    it {should belong_to :ingredient}
  end

  before :each do
    set_up
  end

  describe 'class methods' do
    it 'dish ingredient destroy' do
      DishIngredient.dish_ingredient_destroy(@fish.id, @salmon.id)
      expect(@fish.ingredients).to eq([@potatoes])
    end
  end

  def set_up
    @jon = Chef.create!(name: "Jon Favreau")
    @fish = @jon.dishes.create!(name: "Fishy Dinner", description: "Delicious food")
    @salmon = Ingredient.create!(name: "Salmon", calories: 250)
    @potatoes = Ingredient.create!(name: "Potatoes", calories: 500)
    @di_1 = DishIngredient.create!(dish: @fish, ingredient: @salmon)
    @di_2 = DishIngredient.create!(dish: @fish, ingredient: @potatoes)
  end
end
