class DishesController < ApplicationController

  def show
    @dish = Dish.find(params[:id])
    @dish_ingredients = @dish.ingredients
    @dish_chef = @dish.chef.name
    @chef_id = @dish.chef.id
    @dish_calories = @dish.calorie_count
  end

  def update
    @dish = Dish.find(params[:id])
    @ingredient = Ingredient.find(params[:ingredient_id])
    @ingredient_id = params[:ingredient_id]
    @chef_id = @dish.chef.id
    DishIngredient.find_by(ingredient_id: @ingredient_id, dish_id: @dish.id).destroy

    redirect_to "/chefs/#{@chef_id}/dishes/#{@dish.id}"
  end
end
