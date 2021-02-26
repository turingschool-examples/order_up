class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.find_from_chef(params[:chef_id])
  end
end
