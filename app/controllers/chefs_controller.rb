class ChefsController < ApplicationController
  def show
    @chef = Chef.find(params[:id])
    @popular_ingredients = Ingredient.popular_ingredients_for(@chef.id)
  end
end
