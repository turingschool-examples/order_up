class IngredientsController < ApplicationController
  def index
    if params[:chef_id]
      @chef = Chef.find(params[:chef_id])
      @ingredients = Ingredient.all
    end
  end

end
