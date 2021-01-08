class Ingredient < ApplicationRecord
  validates_presence_of :name
  has_many :recipes
  has_many :dishes, through: :recipes
end
