class IngredientsController < ApplicationController

  def index
    @chef = Chef.find(params[:chef_id])
    @ingredients = @chef.ingredients_list
  end
end