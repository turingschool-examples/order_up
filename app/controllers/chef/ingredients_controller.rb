class Chef::IngredientsController < ApplicationController
  def index
    @chef = Chef.find(params[:id])
    @ingredients = @chef.ingredients
  end
end