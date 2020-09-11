class ChefsController < ActionController::Base
  def show
    @chef = Chef.find(params[:id])
  end
end
