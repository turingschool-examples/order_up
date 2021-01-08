class IngredientsController < ApplicationController
  def index
    @ingredients = Chef.find(params[:chef_id]).unique_ingredients
  end
end
