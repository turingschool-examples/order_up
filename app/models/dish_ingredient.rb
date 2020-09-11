class DishIngredient < ApplicationRecord
  has_many :ingredients
  has_many :dishes
end
