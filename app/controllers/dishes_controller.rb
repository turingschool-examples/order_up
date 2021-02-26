class DishesController < ApplicationController
  def show
    @dish = Dish.find(params[:id])
  end

  def destroy
    dish_ingredient = DishIngredient.find(dish_id: params[:id], ingredient_id: parmsp[:ingredient_id])
  end
end