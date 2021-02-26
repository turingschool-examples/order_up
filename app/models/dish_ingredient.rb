class DishIngredient < ApplicationRecord
  belongs_to :dish
  belongs_to :ingredient
  has_one :chef, through: :dish
end
