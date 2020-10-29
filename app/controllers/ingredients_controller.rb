class IngredientsController < ApplicationController
  def show
    @chef = Chef.find(params[:id])
    require "pry"; binding.pry
    @ingredients = @chef.find_ingredients
  end
end
