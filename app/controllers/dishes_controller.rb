class DishesController < ApplicationController

  def show
    @dish = Dish.find(params[:id])
    @dish_ingredients = @dish.ingredients
    @dish_chef = @dish.chef.name
  end
end
