class DishesController < ApplicationController
  before_action :set_dish, only: [:show]

  def show
  end

  private

  def set_dish
    @dish = Dish.find(params[:id])
  end
end