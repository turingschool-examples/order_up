class Chef::IngredientsController < ApplicationController

  def show
    @chef = Chef.find(params[:id])
  end
end
