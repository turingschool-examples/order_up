class DishIngredient < ApplicationRecord
  validates_presence_of :dish_id
  validates_presence_of :ingredient_id

  belongs_to :dish
  belongs_to :ingredient
end