class IngredientDishesController < ApplicationController
  def create
    dish = Dish.find(params[:dish_id])
    ingredient = Ingredient.find(params[:ingredient_id])
    dish.ingredients << ingredient
  end
end
