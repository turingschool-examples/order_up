class DishesController < ApplicationController

  def show
    @dish = Dish.find(params[:id])
    @chef = Chef.find(@dish.chef_id)
    require "pry"; binding.pry
  end

  private

  def dish_params
    params.permit(:name,
                  :description)
  end
end
