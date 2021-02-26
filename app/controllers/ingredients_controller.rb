class IngredientsController < ApplicationController
  def index
    @chef = Chef.find(params[:id])
    @ingredients = @chef.chef_ingredients
  end
end
