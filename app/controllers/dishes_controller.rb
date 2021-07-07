class DishesController < ApplicationController

  def index
  @dishes = Dish.all
  end

  def show
    @dish = Dish.find(params[:id])
  end

  private
  def dish_params
    params.permit(:name,
                  :description,
                  :chef_id,
                )
  end
end
