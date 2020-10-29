class Ingredient < ApplicationRecord
  has_many :meals
  has_many :dishes, through: :meals
end
