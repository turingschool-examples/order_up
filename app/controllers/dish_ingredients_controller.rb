class DishIngredientsController < ApplicationController

  def destroy
    @dish = Dish.find(params[:dish_id])
    @ingredient = Ingredient.find(params[:ingredient_id])
    if @dish.ingredients.delete(@ingredient)
      redirect_to "/dishes/#{params[:dish_id]}"
      flash.now[:notice] = "Ingredient successfully removed!"

    else
      flash.now[:notice] = "ingredient could not be!"
      redirect_to "/dishes/#{params[:dish_id]}"
    end
  end

  private
  def dish_ingredient_params
    params.permit(:dish_id, :ingredient_id)
  end
end
