class ChefsController < ApplicationController

  def show
    @chef = Chef.find(params[:id])
  end

  def chef_ingredients
    @ingredients = Chef.find(params[:id]).ingredients
  end

end
