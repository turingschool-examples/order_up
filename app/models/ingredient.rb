class Ingredient < ApplicationRecord
  validates_presence_of :name, :calories
  belongs_to :dish
end
