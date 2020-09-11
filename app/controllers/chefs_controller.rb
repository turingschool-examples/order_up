class ChefsController < ApplicationController
  def show
    @chef = Chef.find(params[:chef_id])
  end
end
