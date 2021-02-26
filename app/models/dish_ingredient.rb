class DishIngredient < ApplicationRecord
  belongs_to :dish
  belongs_to :ingredient
  validates_presence_of :dish
  validates_presence_of :ingredient
end