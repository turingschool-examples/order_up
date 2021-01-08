class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
    @chef = Chef.find(params[id: :chef_id])
  end
end
