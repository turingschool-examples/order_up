class DishIngredientsController < ApplicationController
  def destroy
    @dish = Dish.find(params[:dish_id])
    @chef_id = @dish.chef.id
    DishIngredient.destroy(params[:id])
    redirect_to chef_dish_path(@dish, chef_id: @chef_id)
  end
end
