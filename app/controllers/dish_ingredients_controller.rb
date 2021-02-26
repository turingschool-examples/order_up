class DishIngredientsController < ApplicationController

  def destroy
    dish_ingredient_id = DishIngredient.where("ingredient_id = ? AND dish_id = ?", params[:ingredient_id], params[:id]).pluck(:id)
    DishIngredient.destroy(dish_ingredient_id)

    redirect_to "/dishes/#{params[:id]}"
  end
end
