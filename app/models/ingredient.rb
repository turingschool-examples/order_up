class Ingredient < ApplicationRecord
  has_many :meals
  has_many :dishes, through: :meals
  belongs_to :chef
end
