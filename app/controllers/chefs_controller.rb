class ChefsController < ApplicationController
  def show
    @chef = Chef.find(params[:id])
  end

  def ingredient_index
    @chef = Chef.find(params[:id])
  end
end
