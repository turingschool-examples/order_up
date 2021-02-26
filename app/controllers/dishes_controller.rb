class DishesController < ApplicationController
  def show
    @chef = Chef.find(params[:chef_id])
    @dish = Dish.find(params[:id])
  end
end
