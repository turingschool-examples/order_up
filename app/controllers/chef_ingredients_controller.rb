class ChefIngredientsController < ApplicationController
  def index
    @chef_ingredients = Chef.chef_ingredients(params[:id])
  end
end
