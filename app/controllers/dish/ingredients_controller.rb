class Dish::IngredientsController < ApplicationController
  def destroy
    di = DishIngredient.find(ingredient: params[:dish_id], dish: params[:ingredient_id])
    di.destroy!
    redirect_to "/dishes/#{params[:dish_id]}"
  end
end
