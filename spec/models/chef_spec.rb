require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
  end

  describe "instance methods" do
    it "distinct_ingredients" do
      franc = Chef.create!(name: "Francois Francesco")
      ratatouille = franc.dishes.create!(
                                          name: "Ratatouille",
                                          description: "Spicy and delicious!"
                                        )
      spaghetti = franc.dishes.create!(
                                          name: "Spaghetti and Meatballs",
                                          description: "Mouthwatering and flavourful."
                                        )
      egg = Ingredient.create!(name: "eggplant", calories: 100)
      tomato = Ingredient.create!(name: "tomato", calories: 80)
      zucc = Ingredient.create!(name: "zucchini", calories: 120)

      basil = Ingredient.create!(name: "basil", calories: 20)
      sausage = Ingredient.create!(name: "italian sausage", calories: 200)
      wine = Ingredient.create!(name: "Cabernet Sauvignon", calories: 150)

      DishIngredient.create!(dish_id: ratatouille.id, ingredient_id: egg.id)
      DishIngredient.create!(dish_id: ratatouille.id, ingredient_id: basil.id)
      DishIngredient.create!(dish_id: ratatouille.id, ingredient_id: tomato.id)
      DishIngredient.create!(dish_id: ratatouille.id, ingredient_id: zucc.id)
      DishIngredient.create!(dish_id: spaghetti.id, ingredient_id: sausage.id)
      DishIngredient.create!(dish_id: spaghetti.id, ingredient_id: tomato.id)
      DishIngredient.create!(dish_id: spaghetti.id, ingredient_id: wine.id)
      DishIngredient.create!(dish_id: spaghetti.id, ingredient_id: basil.id)

      ingredients = [egg.name, tomato.name, zucc.name, basil.name, sausage.name, wine.name].sort

      expect(franc.distinct_ingredients).to eq(ingredients)
    end

    it 'popular_ingredients' do
      franc = Chef.create!(name: "Francois Francesco")
      ratatouille = franc.dishes.create!(
                                          name: "Ratatouille",
                                          description: "Spicy and delicious!"
                                        )
      spaghetti = franc.dishes.create!(
                                          name: "Spaghetti and Meatballs",
                                          description: "Mouthwatering and flavourful."
                                        )
      egg = Ingredient.create!(name: "eggplant", calories: 100)
      tomato = Ingredient.create!(name: "tomato", calories: 80)
      zucc = Ingredient.create!(name: "zucchini", calories: 120)
      salt = Ingredient.create!(name: "salt", calories: 10)
      basil = Ingredient.create!(name: "basil", calories: 20)
      sausage = Ingredient.create!(name: "italian sausage", calories: 200)
      wine = Ingredient.create!(name: "Cabernet Sauvignon", calories: 150)

      DishIngredient.create!(dish_id: ratatouille.id, ingredient_id: egg.id)
      DishIngredient.create!(dish_id: ratatouille.id, ingredient_id: basil.id)
      DishIngredient.create!(dish_id: ratatouille.id, ingredient_id: tomato.id)
      DishIngredient.create!(dish_id: ratatouille.id, ingredient_id: zucc.id)
      DishIngredient.create!(dish_id: ratatouille.id, ingredient_id: salt.id)

      DishIngredient.create!(dish_id: spaghetti.id, ingredient_id: sausage.id)
      DishIngredient.create!(dish_id: spaghetti.id, ingredient_id: tomato.id)
      DishIngredient.create!(dish_id: spaghetti.id, ingredient_id: wine.id)
      DishIngredient.create!(dish_id: spaghetti.id, ingredient_id: basil.id)
      DishIngredient.create!(dish_id: spaghetti.id, ingredient_id: salt.id)

      ingredients = [tomato, salt, basil]

      expect(franc.popular_ingredients).to eq(ingredients)
    end
  end
end
