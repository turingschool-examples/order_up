class Ingredient < ApplicationRecord
  validates_presence_of :name
  has_many :dish_ingredients
  has_many :dishes, through: :dish_ingredients
end
