class DishIngredientsController < ApplicationController
  def destroy
    DishIngredient.destroy(params[:id])
    dish = Dish.find(params[:dish_id])
    redirect_to dish_path(dish)
  end
end
