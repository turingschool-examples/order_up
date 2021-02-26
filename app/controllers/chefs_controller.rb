class ChefsController < ApplicationController

  def show
    @chef = Chef.find(params[:id])
    @chef_top_ingredients = @chef.top_ingredients
  end
end
