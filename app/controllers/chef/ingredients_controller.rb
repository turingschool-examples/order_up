class Chef::IngredientsController < ApplicationController
  def show
    @chef = Chef.find(params[:chef_id])

    # binding.pry
    # @dish = Dish.find(params[:dish_id])
  end
end
