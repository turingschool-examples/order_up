class Ingredient < ApplicationRecord
  validates_presence_of :name
  validates :calories, numericality: { greater_than: 0 }

  has_many :dish_ingredients, dependent: :destroy
  has_many :dishes, through: :dish_ingredients
end