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

  describe 'instance methods' do
    it 'chef ingredients' do
      expected = [@salmon, @potatoes, @bread, @pork]

      expect(@jon.chef_ingredients).to eq(expected)
    end

    it 'chef ingredient dishes' do
      expected = [@salmon.id, @potatoes.id, @bread.id, @pork.id]

      expect(@jon.chef_ingredient_dishes).to eq(expected)
    end

    it 'most popular ingredients id' do
      expected = [@potatoes.id, @pork.id, @salmon.id]

      expect(@jon.most_popular_ingredients_id).to eq(expected)
    end

    it 'most popular ingredients' do
      expected = [@potatoes, @pork, @salmon]

      expect(@jon.most_popular_ingredients).to eq(expected)
    end
  end

  def set_up
    @jon = Chef.create!(name: "Jon Favreau")
    @fish = @jon.dishes.create!(name: "Fishy Dinner", description: "Delicious food")
    @cuban = @jon.dishes.create!(name: "Cuban Sandwich", description: "My specialty")
    @tacos = @jon.dishes.create!(name: "Street Tacos", description: "A taste of mexico")
    @salmon = Ingredient.create!(name: "Salmon", calories: 250)
    @potatoes = Ingredient.create!(name: "Potatoes", calories: 500)
    @bread = Ingredient.create!(name: "Bread", calories: 300)
    @pork = Ingredient.create!(name: "Pork", calories: 225)
    DishIngredient.create!(dish: @fish, ingredient: @salmon)
    DishIngredient.create!(dish: @fish, ingredient: @potatoes)
    DishIngredient.create!(dish: @cuban, ingredient: @potatoes)
    DishIngredient.create!(dish: @cuban, ingredient: @bread)
    DishIngredient.create!(dish: @cuban, ingredient: @pork)
    DishIngredient.create!(dish: @tacos, ingredient: @pork)
    DishIngredient.create!(dish: @tacos, ingredient: @potatoes)
  end
end
