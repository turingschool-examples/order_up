class ChefsController < ApplicationController

  def show
    @chef = Chef.find(params[:id])
  end

  def show_ingredients
    @chef = Chef.find(params[:id])
    @ingredients = @chef.dishes.flat_map do |dish|
      dish.ingredients
    end
  end
end
