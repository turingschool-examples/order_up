class ChefsController < ApplicationController
  def show
    @chef = Chef.find(params[:id])
    @ingredients = @chef.popular_ingredients
  end
end