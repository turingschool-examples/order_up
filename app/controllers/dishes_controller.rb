class DishesController < ApplicationController
  def show
    @chef = Chef.find(params[:id])
    # @dishes = @chef.dish
    # @ingredients = @dishes.ingredients
  end
end
