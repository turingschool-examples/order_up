class IngredientsController < ApplicationController
  def index
    chef_id = params[:id]
    @ingredients = Ingredient.where("chef_id = #{chef_id}")
  end
end