class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredients.all
    if params[:chef_id]
      chef = Chef.find(params[:chef_id])
      @ingredients = chef.distinct_ingredients
    end
  end
end
