class IngredientsController < ApplicationController
  def index
    @chef = Chef.find(params[:chef_id])
    @ingredients = Ingredient.joins(:dishes).where("chef_id = #{@chef.id}").pluck(:name).uniq
  end
end
