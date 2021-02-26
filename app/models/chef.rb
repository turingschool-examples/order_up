class Chef < ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def unique_ingredients
    dishes.joins(:ingredients)
    .select('dishes.*, ingredients.*')
    .distinct
    .pluck('ingredients.name')
  end
end
