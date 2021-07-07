class Ingredient < ApplicationRecord
  has_many :recipies
  has_many :dishes, through: :recipies
end
