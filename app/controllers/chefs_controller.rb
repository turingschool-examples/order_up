class ChefsController < ApplicationController

  def index
    @chefs = Chef.all
  end

  def show
    @chef = Chef.find(params[:id])
  end
end
