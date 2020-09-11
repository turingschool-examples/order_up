class ChefsController < ApplicationController
  def show
    @chef = Chef.find(params[:id])
  end

  def show_ingredients
    @chef = Chef.find(params[:id])
  end
end
