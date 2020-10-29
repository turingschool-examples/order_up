class IngredientsController < ApplicationController
  def show
    @chef = Chef.find(params[:id])
    @ingredients = []
    @chef.dishes.each do |dish|
      dish.ingredients.each do |ingredient|
       @ingredients << ingredient
      end
    end
  end
end