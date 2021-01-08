class ChefIngredientsController < ApplicationController
  def index
    @ingredients = Chef.find(params[:id]).ingredients
  end
end
