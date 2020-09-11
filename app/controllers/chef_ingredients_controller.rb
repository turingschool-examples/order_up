class ChefIngredientsController < ActionController::Base
  def index
    @chef = Chef.find(params[:id])
  end
end
