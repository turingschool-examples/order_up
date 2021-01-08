class DishesController < ApplicationController
  def show
    @dish = Dish.find(params[:id])
    @total_calories = @dish.calorie_count
  end
end