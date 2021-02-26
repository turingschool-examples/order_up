class DishIngredient < ApplicationRecord
  belongs_to :dish
  belongs_to :ingredient

  def remove_ingredient(ingredient_id)
    require "pry"; binding.pry
  end
end
