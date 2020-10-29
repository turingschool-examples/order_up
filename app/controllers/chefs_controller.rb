class ChefsController < ApplicationController
  def show
    @chef = Chef.find(params[:id])
  end

  def index
    @chef = Chef.find(params[:id])
  end
end
