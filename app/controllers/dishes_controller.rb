class DishesController < ApplicationController

  def show
    @dish = Dish.find(dish_params[:id])
    @ingredients = @dish.ingredients.pluck(:name)
    @total_calories = @dish.ingredients.pluck(:calories).sum
    @chef = Chef.find(@dish.chef_id)
  end
  
private
  def dish_params
    params.permit(:id, :name, :description)
  end
end
