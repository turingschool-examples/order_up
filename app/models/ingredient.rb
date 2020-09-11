class Ingredient < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :calories
end
