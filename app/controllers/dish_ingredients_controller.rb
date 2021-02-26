class DishIngredientsController < ApplicationController
  def destroy
    dish_ingredient = DishIngredient.find_by(
      dish_id: params[:format],
      ingredient_id: params[:id])

    dish_ingredient.destroy

    redirect_to dish_path(params[:format])
  end
end
