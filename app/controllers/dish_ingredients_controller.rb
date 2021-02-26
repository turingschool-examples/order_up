class DishIngredientsController < ApplicationController
  def destroy
    @dish_ingredient = DishIngredient.find_by(dish_id: params[:id], ingredient_id: params[:ingredient_id])
    DishIngredient.destroy(@dish_ingredient.id)
    
    redirect_to dish_path(params[:id])
  end
end
