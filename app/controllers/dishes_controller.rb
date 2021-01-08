class DishesController < ApplicationController
  before_action :set_dish

  def show
    @total_calories = Dish.total_calories(@dish)
  end

  private

  def set_dish
    @dish = Dish.find(params[:id])
  end
end