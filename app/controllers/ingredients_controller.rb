class IngredientsController < ApplicationController
  def index
    @ingredients = Chef.find(params[:id]).all_chef_ingredients
  end
end
