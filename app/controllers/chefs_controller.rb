class ChefsController < ApplicationController
  def show
    @chef = Chef.find(params[:id])
    @popular_ingredients = Ingredient.popular_ingredients_by_chef(params[:id])
  end
end
