class IngredientsController < ApplicationController
  def show
    @chef = Chef.find(params[:chef_id])
    @ingredients = DishIngredient.where('chef_id = ?', @chef.id).uniq
    DishIngredient.joins(:ingredients).where('ingredient_id = ?', @chef.id)
    @ingredient_test = Ingredient.all
  end
  
end