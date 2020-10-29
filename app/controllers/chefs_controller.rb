class ChefsController < ApplicationController

  def show
    @chef = Chef.find(params[:id])
  end

  def ingredients
    @chef = Chef.find(params[:id])
  end
end
