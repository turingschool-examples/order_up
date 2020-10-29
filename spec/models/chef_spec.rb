require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
  end

  describe "Instance Methods" do
    it "All Ingredients Method" do
      bob = Chef.create!(name: "Bob")
      pasta = Dish.create!(name: "Pasta", description: "Noodle Dish", chef_id: bob.id)
      noodles = Ingredient.create!(name: "Noodles", calories: 50)
      sause = Ingredient.create!(name: "Sause", calories: 100)
      meatballs = Ingredient.create!(name: "Meatballs", calories: 150)
      tacos = Dish.create!(name: "Tacos", description: "Chicken Tacos", chef_id: bob.id)
      shell = Ingredient.create!(name: "Taco Shell", calories: 20)
      chicken = Ingredient.create!(name: "Chicken Breast", calories: 120)
      lettuce = Ingredient.create!(name: "Romane Lettuce", calories: 30)
      sause = Ingredient.create!(name: "Sauce", calories: 100)

      DishIngredient.create!(dish_id: pasta.id, ingredient_id: noodles.id)
      DishIngredient.create!(dish_id: pasta.id, ingredient_id: sause.id)
      DishIngredient.create!(dish_id: pasta.id, ingredient_id: meatballs.id)

      DishIngredient.create!(dish_id: tacos.id, ingredient_id: shell.id)
      DishIngredient.create!(dish_id: tacos.id, ingredient_id: chicken.id)
      DishIngredient.create!(dish_id: tacos.id, ingredient_id: lettuce.id)
      DishIngredient.create!(dish_id: tacos.id, ingredient_id: sause.id)

      expect(bob.all_ingredients).to eq([noodles.name, meatballs.name, sause.name, shell.name, chicken.name, lettuce.name])
    end
  end
end
