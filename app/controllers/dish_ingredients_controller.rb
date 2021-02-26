class DishIngredientsController < ApplicationController
  def destroy
    dish = Dish.find(params[:dish_id])
    ing  = Ingredient.find(params[:ingredient_id])
    dish.ingredients.delete(ing)

    redirect_to "/dishes/#{dish.id}"
  end
end
