require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  
  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :dish_ingredients}
    it {should have_many(:ingredients).through(:dish_ingredients)}
  end

  before :each do
    set_up
  end

  describe 'instance methods' do
    it 'total_calories' do
      expect(@fish.total_calories).to eq(750)
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
