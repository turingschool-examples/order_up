class DishesController < ApplicationController
  def show
    @dish = Dish.find(params[:dish_id])
    @chef = Chef.find(@dish.chef_id)
  end
  
end