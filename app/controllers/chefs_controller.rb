class ChefsController < ApplicationController

  def show
    @chef = Chef.find_by_id(params[:id])
  end

end
