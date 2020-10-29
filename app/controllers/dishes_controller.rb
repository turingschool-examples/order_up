class DishesController < ApplicationController

  def show
    @dish = Dish.find_by_id(params[:id])
  end

end
