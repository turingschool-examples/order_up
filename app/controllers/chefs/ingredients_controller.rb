class Chefs::IngredientsController < ApplicationController
  def index
    @chef = Chef.find(params[:chef_id])
    @ingredients = @chef.all_ingredients
  end
end