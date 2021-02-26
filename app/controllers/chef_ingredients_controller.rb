class ChefIngredientsController < ApplicationController


  def index
    find_chef
    @ingredients = find_chef.all_ingredients
  end

  private

  def find_chef
    @chef = Chef.find(params[:id])
  end

end
