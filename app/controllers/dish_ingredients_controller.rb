class DishIngredientsController < ApplicationController

  def destroy
    remove_ingredient = DishIngredient.where(:dish_id => params[:dish].to_i, :ingredient_id => params[:ingredient].to_i)
    DishIngredient.destroy(remove_ingredient.first.id)
    redirect_to "/dishes/#{params[:dish].to_i}"
  end

  private
  def dish_ingredient_params
    params.permit(:dish.to_i, :ingredient.to_i)
  end

end
