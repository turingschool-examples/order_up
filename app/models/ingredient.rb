class Ingredient < ApplicationRecord
  has_many :dishes_ingredients
  has_many :dishes, through: :dishes_ingredients
end
