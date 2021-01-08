require 'rails_helper'

RSpec.describe Dish, type: :model do
  before(:each) do
    # Chefs: 
    @chef1     = Chef.create!(name: "Henry Dapasta")
    @chef2     = Chef.create!(name: "Molly LaBaker")
    # Dishes:
    @dish1     = Dish.create!(name: 'Sphaghetti', description: 'Sphaghetti noodles with red marinara meat sauce', chef_id: @chef1.id)
    @dish2     = Dish.create!(name: 'Apple Cake', description: 'German Apfel Torte with creme anglaise', chef_id: @chef2.id)
    # Ingredients:
    @apple     = Ingredient.create!(name:'Apple', calories: 35)
    @noodle    = Ingredient.create!(name:'Spaghetti Noodle', calories: 135)
    @sauce     = Ingredient.create!(name:'Sauce', calories: 200)
    @pie_crust = Ingredient.create!(name:'Pie Crust', calories: 150)
    # Dish Ingredients:
    @apple_cake1 = DishIngredient.create!(dish_id: @dish2.id, ingredient_id: @apple.id)
    @apple_cake2 = DishIngredient.create!(dish_id: @dish2.id, ingredient_id: @pie_crust.id)
    @spaghetti1 = DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @noodle.id)
    @spaghetti2 = DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @sauce.id)
  end
  
  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :dish_ingredients}
    it {should have_many(:ingredients).through(:dish_ingredients)}
  end
  # User Story 2
  it 'Can calculate the total calories of a dish' do
    expect(@dish2.total_calories).to eq(185)
  end
end
