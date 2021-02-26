class RecipesController < ApplicationController

  def destroy
    recipe = Recipe.where(dish_id: params[:dish_id], ingredient_id: params[:ingredient_id]).first
    Recipe.destroy(recipe.id)
    
    redirect_to dish_path(params[:dish_id])
  end
end 