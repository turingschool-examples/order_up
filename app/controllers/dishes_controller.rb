class DishesController < ApplicationController
  def show
    @dish = Dish.find(params[:id])
    @ingredients = @dish.ingredients
    @chef = @dish.chef
  end

  # def update
  #   if params[:remove]
  #     @dish = Dish.find(params[:id])
  #     @dish_ingredient = DishIngredient.where(dish_id: @dish.id, ingredient_id: params[:remove]).first
  #     DishIngredient.find(@dish_ingredient.id).destroy
  #
  #     redirect_to "/dishes/#{@dish.id}"
  #   end
  # end
end
