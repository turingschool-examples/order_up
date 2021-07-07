require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
  end
  describe "model methods" do
    el_hefe = Chef.create(name: "El Hefe")
    bonzo = Chef.create(name: "Bonzo Bean")
    dish_1 = el_hefe.dishes.create(name: "Cubano", description: "Food Truck Cubano!")
    dish_2 = bonzo.dishes.create(name: "Boring Beans", description: "Come get your boring beans")
    ingredient_1 = Ingredient.create(name: "Ham", calories: 50)
    ingredient_2 = Ingredient.create(name: "Mustard", calories: 5)
    ingredient_3 = Ingredient.create(name: "Bun", calories: 120)
    ingredient_4 = Ingredient.create(name: "Beans", calories: 220)
    DishIngredient.create(dish_id: dish_1.id, ingredient_id: ingredient_1.id)
    DishIngredient.create(dish_id: dish_1.id, ingredient_id: ingredient_2.id)
    DishIngredient.create(dish_id: dish_1.id, ingredient_id: ingredient_3.id)
    DishIngredient.create(dish_id: dish_2.id, ingredient_id: ingredient_4.id)

    actual = el_hefe.unique_ingredients.map do |ingredient|
      ingredient.name
    end
    expect(actual).to eq([ingredient_1.name, ingredient_2.name, ingredient_3.name])
  end
end
