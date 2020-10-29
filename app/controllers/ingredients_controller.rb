class IngredientsController < ApplicationController
  def index
    @ingredients = Chef.find(params[:chef_id]).all_chef_ingredients
  end
end
