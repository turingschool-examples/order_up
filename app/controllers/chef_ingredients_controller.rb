class ChefIngredientsController < ApplicationController

  def index
    @chef = Chef.find(params[:id])
    @ingredients = @chef.chef_ingredients(@chef)
  end

end
