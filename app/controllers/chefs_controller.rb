class ChefsController < ApplicationController

  def show
    @chef = Chef.find(params[:id])
  end

  def ingredients_index
    @chef = Chef.find(params[:chef_id])
  end
end
