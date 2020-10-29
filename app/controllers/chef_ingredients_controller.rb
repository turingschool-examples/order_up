class ChefIngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
  end
end
