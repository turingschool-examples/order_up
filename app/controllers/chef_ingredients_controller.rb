class ChefIngredientsController < ApplicationController
  def index
    @chef = Chef.find(params[:chef_id])
    @dishes = Dish.where(chef_id: @chef.id)
  end
end
