class Ingredient < ApplicationRecord
  has_many :ingredient_dishes
  has_many :dishes, through: :ingredient_dishes
end
