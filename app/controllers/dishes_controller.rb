class DishesController < ApplicationController

  def show
    @dish = Dish.find(params[:id])
    require "pry"; binding.pry
  end

  private

  def dish_params
    params.permit(:name,
                  :dscription)
  end
end
