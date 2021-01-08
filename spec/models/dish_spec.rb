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
  describe 'instance methods' do
    it 'total_calories' do
    @chef_1 = Chef.create(name: 'Gordon Rembsy')
    @dish_1 = @chef_1.dishes.create!(name: 'Beef Wellington', description: 'Pastry heaven wrapped in bacon')
    @ingredient_1 = Ingredient.create(name: 'Beef', calories: 300)
    @ingredient_2 = Ingredient.create(name: 'Bacon', calories: 350)
    @ingredient_3 = Ingredient.create(name: 'Pastry', calories: 250)
    DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingredient_1.id)
    DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingredient_2.id)
    DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingredient_3.id)

    expect(@dish_1.total_calories).to eq(900)
    end
  end
end
