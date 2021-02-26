class IngredientsController < ApplicationController
  def index
    chef = Chef.find(params[:id])
    @chef_ingredients = chef.chef_unique_ingredients
  end
end