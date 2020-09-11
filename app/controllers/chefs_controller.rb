class ChefsController < ApplicationController

  def show
    @chef = Chef.find(params[:id])
  end

  def show_ingredients
    @chef = Chef.find(params[:id])

    @dish_ingredients = @chef.dish_ingredients

    @ingredients = @dish_ingredients.map do |dish_ing|
      Ingredient.find(dish_ing.dish_id)
    end

    ingredients = Hash.new
    @dish_ingredients.each do |dish_ing|
      if ingredients[dish_ing.ingredient_id] == nil
        ingredients[dish_ing.ingredient_id] = 1
      else
        ingredients[dish_ing.ingredient_id] += 1
      end
    end
    ingredients = ingredients.invert.max(3).flatten
    ingredients.delete_at(0)
    ingredients.delete_at(1)
    ingredients.delete_at(2)
    @most_popular_ingredients = ingredients
  end
end
