class DishesController < ApplicationController
  def show
    @dish = Dish.find(params[:id])
    @chef = Chef.find(@dish.chef_id)
  end
end
