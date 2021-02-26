class DishIngredient <ApplicationRecord
  belongs_to :ingredient
  belongs_to :dish

  def dish_ingredients
    require "pry"; binding.pry
    Dish.ingredients
  end
end
