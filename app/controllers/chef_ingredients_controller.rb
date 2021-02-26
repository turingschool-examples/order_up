class ChefIngredientsController < ApplicationController

  def index
    @chef = Chef.find(params[:chef_id])
  end

  def destroy
    require "pry"; binding.pry
    @chef = Chef.find(params[:chef_id])
    #DishIngredient.destroy(params[:id])
    redirect_to chef_ingredients_path(@chef)
  end
end
