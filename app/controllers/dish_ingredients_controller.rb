class DishIngredientsController < ApplicationController

  def destroy
    di = DishIngredient.where(dish_id: params[:dish_id], ingredient_id: params[:ingredient_id]).first
    di.destroy

    redirect_to "/dishes/#{params[:dish_id]}"
  end
end