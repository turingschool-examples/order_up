require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
  end
  before :each do
    set_up
  end

  describe 'instacne methods' do
    it 'chef ingredients' do
      expect(@jon.chef_ingredients).to eq([@salmon, @potatoes])
    end
  end

  def set_up
    @jon = Chef.create!(name: "Jon Favreau")
    @fish = @jon.dishes.create!(name: "Fishy Dinner", description: "Delicious food")
    @salmon = Ingredient.create!(name: "Salmon", calories: 250)
    @potatoes = Ingredient.create!(name: "Potatoes", calories: 500)
    DishIngredient.create!(dish: @fish, ingredient: @salmon)
    DishIngredient.create!(dish: @fish, ingredient: @potatoes)
  end
end
