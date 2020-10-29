class DishesController < ApplicationController
  def show
    @dish = Dish.find(params[:id])
    @chef = @dish.chef
    @ingredients = @dish.ingredients
  end
end
