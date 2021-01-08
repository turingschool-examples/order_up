class DishIngredientsController < ApplicationController
  def index
    @chef = Chef.find(params[:chef_id])
    @dish_ingreds = @chef.find_ingredients
  end
end