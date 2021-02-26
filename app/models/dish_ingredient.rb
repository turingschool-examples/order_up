class DishIngredient < ApplicationRecord
  belongs_to :dish
  belongs_to :ingredient

  def self.dish_ingredient_destroy(dish_id, ingredient_id)
    find_by(dish_id: dish_id, ingredient_id: ingredient_id).destroy
  end
end
