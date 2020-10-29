class IngredientsController < ApplicationController

  def index
    @ingredients = Chef.find_by_id(params[:chef_id]).distinct_ingredients
  end

end
