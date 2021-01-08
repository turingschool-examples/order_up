class Ingredient < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :calories, numericality: { only_integer: true}

  has_many :recipes
  has_many :dishes, through: :recipes
end
