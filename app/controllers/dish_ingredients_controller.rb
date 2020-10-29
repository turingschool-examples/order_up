class DishIngredientsController < ApplicationController

  def index
    @chef = Chef.find(params[:id])
  end

end
