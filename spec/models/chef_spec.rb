require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
  end

  describe 'model methods' do
    it "should return a uniq list of ingredients the chef uses" do
      gordon = Chef.create({name: "Gordon Ramsey"})

      burger = Dish.create({name: "Cheese Burger", description: "Famous Burger", chef_id: gordon.id})
      buns = Ingredient.create({name: "Buns", calories: 60})
      patty = Ingredient.create({name: 'Patty', calories: 120})
      tomato = Ingredient.create({name: 'Tomato', calories: 30})
      onion = Ingredient.create({name: 'Onion', calories: 20})
      DishIngredient.create({dish_id: burger.id, ingredient_id: buns.id})
      DishIngredient.create({dish_id: burger.id, ingredient_id: patty.id})
      DishIngredient.create({dish_id: burger.id, ingredient_id: tomato.id})
      DishIngredient.create({dish_id: burger.id, ingredient_id: onion.id})

      chicken_alfredo = Dish.create({name: "Fettuccine Alfredo", description: "Famous pasta", chef_id: gordon.id})
      pasta = Ingredient.create({name: "Pasta", calories: 80})
      chicken = Ingredient.create({name: "Chicken", calories: 150})
      DishIngredient.create({dish_id: chicken_alfredo.id, ingredient_id: pasta.id})
      DishIngredient.create({dish_id: chicken_alfredo.id, ingredient_id: chicken.id})

      cheese = Ingredient.create({name: "Cheese", calories: 60})
      DishIngredient.create({dish_id: chicken_alfredo.id, ingredient_id: cheese.id})
      DishIngredient.create({dish_id: burger.id, ingredient_id: cheese.id})

      expect(gordon.all_ingredients).to eq([buns,patty,tomato,onion,pasta,chicken,cheese])
    end
  end
end
