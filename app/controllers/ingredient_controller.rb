class IngredientController < ApplicationController
  def index
    binding.pry
    @chef = Chef.find(params[:id])
  end
end
