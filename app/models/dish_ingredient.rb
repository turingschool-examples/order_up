class DishIngredient < ApplicationRecord
  validates_presence_of :quantity
  belongs_to :dish
  belongs_to :ingredient
end
