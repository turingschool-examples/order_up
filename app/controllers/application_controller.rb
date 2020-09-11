class ApplicationController < ActionController::Base
  helper_method :chef

  def chef
    @chef = Chef.find(params[:chef_id])
  end
  
end
