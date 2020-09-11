class Ingredient < ApplicationRecord
  has_many :recipes
  has_many :dishes, through: :recipes

  validates_presence_of :name
  validates_presence_of :calories
end
