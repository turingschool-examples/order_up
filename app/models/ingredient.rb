class Ingredient < ApplicationRecord
  validates_presence_of :name, :quantity, :units, :calories_per_unit

  has_many :dish_ingredients
  has_many :dishes, through: :dish_ingredients
end
