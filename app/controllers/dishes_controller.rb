class DishesController < ActionController::Base
  def show
    @dish = Dish.find(params[:id])
  end
end
