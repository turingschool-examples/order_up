class DishIngredientsController < ApplicationController
  def destroy
    @dish = Dish.find(params[:id])
    DishIngredient.dish_ingredient_destroy(@dish.id, params[:remove])

    redirect_to "/dishes/#{@dish.id}"
  end
end
