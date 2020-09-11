class ChefsController < ApplicationController

  def show
    @chef_1 = Chef.find(params[:id])
  end

end
