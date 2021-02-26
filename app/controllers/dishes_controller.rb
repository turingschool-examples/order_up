class DishesController < ApplicationController
  def show
    @dish = Dish.find(params[:id])
    @ingredients = @dish.ingredients
    @chef = Chef.find(@dish.chef_id)
  end
end
