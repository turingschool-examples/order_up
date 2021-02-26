require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end

  describe "relationships" do
    it {should have_many :dishes}
  end

  # describe "instance_methods" do
  #   it '#chef_ingredients' do
  #     @chef1 = Chef.create(name: 'Tommy', id: 1)
  #     @dish1 = Dish.create(name: 'Pizza', description: 'You might hate yourself after, but damn if it is not delicious', chef_id: 1)
  #     @ingredient1 = Ingredient.create(name: 'Sauce', calories: 50)
  #     @ingredient2 = Ingredient.create(name: 'Dough', calories: 200)
  #     @ingredient3 = Ingredient.create(name: 'Cheese', calories: 100)
  #     @ingredient4 = Ingredient.create(name: 'Pepperoni', calories: 150)
  #     @ingredient5 = Ingredient.create(name: 'Olive Oil', calories: 300)
  #     @ingredient6 = Ingredient.create(name: 'Bacon', calories: 200)
  #     DishIngredient.create(dish: @dish1, ingredient: @ingredient1)
  #     DishIngredient.create(dish: @dish1, ingredient: @ingredient2)
  #     DishIngredient.create(dish: @dish1, ingredient: @ingredient3)
  #     DishIngredient.create(dish: @dish1, ingredient: @ingredient4)
  #
  #     expect(@chef1.chef_ingredients(@chef1).count).to eq(4)
  #   end
  # end
end
