class ChefsIngredientsController < ApplicationController
  def index
    chef = Chef.find(params[:chef_id])
    @ingredients = chef.chefs_ingredients
  end
end
