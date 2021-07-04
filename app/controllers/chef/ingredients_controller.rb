class Chef::IngredientsController < ApplicationController
  def index
    @dishes = Chef.find(params[:id]).dishes
  end
end
