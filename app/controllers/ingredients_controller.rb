class IngredientsController < ApplicationController
  def index
    # binding.pry
    @chef = Chef.find(params[:chef_id])
  end
end
