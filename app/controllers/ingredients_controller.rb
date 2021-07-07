class IngredientsController < ApplicationController

  def index
    @chef = Chef.find(params[:chef_id])
    require "pry"; binding.pry
  end
end
