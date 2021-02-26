class IngredientsController < ApplicationController
  def index
    @ingredients = (Chef.find(params[:chef_id]).ingredients_used)
  end
end
