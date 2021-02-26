class Chef::IngredientsController < ApplicationController
  def index
    @chef = Chef.find(params[:id])
  end
end
