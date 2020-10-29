class Chef::IngredientsController < ApplicationController

  def show
    Chef.find(params[:id])
  end
end
