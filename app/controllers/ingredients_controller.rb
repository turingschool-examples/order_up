class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.find_distinct(params[:chef_id])
  end
end
