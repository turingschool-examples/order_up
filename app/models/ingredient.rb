class Ingredient < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :calories
  has_many :dish_ingredients
  has_many :dishes, through: :dish_ingredients

  def self.calorie_count
    sum(:calories)
  end

  def self.unique_names
    distinct.pluck(:name)
  end
end
