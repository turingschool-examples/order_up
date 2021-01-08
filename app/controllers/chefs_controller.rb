class ChefsController < ApplicationController
  def show
    @chef = Chef.find(params[:id])
    @ingredients = @chef.popular_ingredients(3)
  end
end