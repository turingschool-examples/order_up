class DishesController < ApplicationController

  def show
    @chef = Chef.find(params[:chef_id])
    @dish = Dish.find(params[:id])
  end

  def destroy
    @chef = Chef.find(params[:chef_id])
    @dish = Dish.find(params[:id])
    ingredient = DishIngredient.find_by(ingredient_id: params[:format])
    ingredient.destroy
    redirect_to chef_dish_path(@chef, @dish)
  end
end
