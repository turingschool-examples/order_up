class DishIngredientsController <applicationController

  def destroy
    @dish = Dish.find(params[:dish_id])
    @relationship = @dish.dish_ingredients.where(ingrediant_id: "#{params[:ingredient_id]}").first
    @relationship.destroy

    redirect_to("/dishes/#{params[:dish_id]}")
  end
end
