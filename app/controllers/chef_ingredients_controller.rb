class ChefIngredientsController < ApplicationController
  def index
    require "pry"; binding.pry
    chef = Chef.find(params[:chef_id])
  end
end
