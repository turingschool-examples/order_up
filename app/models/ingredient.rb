class Ingredient < ApplicationRecord
  has_many :dish_ingredients
  has_many :dishes, through: :dish_ingredients
  has_many :chefs, through: :dishes
end
