class ChefIngredientsController < ApplicationController
  def index
    @chef = Chef.find(params[:id])
  end

  # def remove_ingredient
  #   @chef = Chef.find(params[:id])
  #   @chef.remove_ingredient(params[:ingredient_id])
  #   redirect_to "/chefs/#{@chef.id}"
  # end
end
