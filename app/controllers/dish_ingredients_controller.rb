class DishIngredientsController < ApplicationController
  def destroy
    
    DishIngredient.destroy(params[:id])
    redirect_to "/dishes/#{params[:dish_id]}"
  end
end
