class ChefIngredientsController < ApplicationController

  def show
    @chef = Chef.find(params[:id])
    @chef_ingredients = @chef.all_ingredients_used
  end
end
