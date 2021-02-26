class  DishesController < ApplicationController

  def show
    @chef = Chef.find(params[:chef_id])
    @dish = Dish.find(params[:id])
  end

  def update
    @chef = Chef.find(params[:chef_id])
    @dish = Dish.find(params[:id])
    DishIngredient.where(dish_id: @dish, ingredient_id: params[:remove]).destroy(params[:remove])
    redirect_to "/chefs/#{@chef.id}/dishes/#{@dish.id}"
  end
end
