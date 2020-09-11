class IngredientsController < ApplicationController

  def index
    @chef = Chef.find(params[:id])
    @dishes = Dish.where(chef_id: @chef.id)
    @dishes.map {|dish| dish.id}
    @ingredients = Ingredient.where(dish_id: @dishes).distinct.pluck(:name)
  end


end
