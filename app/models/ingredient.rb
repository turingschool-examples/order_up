class Ingredient < ApplicationRecord
  has_many :dish_ingredients
  has_many :dishes, through: :dish_ingredients
  has_many :chefs, through: :dishes

  validates_presence_of :name
end
