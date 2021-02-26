class IngredientsController < ApplicationController
  def index
    # binding.pry
    @chef = Chef.find(params[:chef_id])
  end

  def destroy
    binding.pry
  end
end
