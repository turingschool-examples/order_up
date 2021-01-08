class ChefsController < ApplicationController
  def show
    @chef = Chef.find(params[:id])
  end

  def update
    Dish.joins(:ingredients).where("ingredient.name = #{params[:Ingredient]}")
  end
end
