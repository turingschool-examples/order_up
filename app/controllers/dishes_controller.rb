class DishesController < ApplicationController
  def show
    @dish = Dish.find(dish_params[:id])
  end

  private
  def dish_params
    params.permit(:name, :description, :id)
  end
end
