class DishesController < ApplicationController
  def show
    @dish = Dish.find(params[:dish_id])
  end
end
