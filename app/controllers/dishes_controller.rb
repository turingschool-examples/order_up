class DishesController < ApplicationController

  def show
    @dish = Dish.find(dish_params[:id])
    @chef = Chef.find(@dish.chef_id)
  end
private
  def dish_params
    params.permit(:id, :name, :description)
  end
end
