class ChefIngredientsController < ApplicationController
  def index
    @chef = Chef.find(params[:id])
  end
end