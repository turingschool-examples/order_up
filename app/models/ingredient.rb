class Ingredient < ApplicationRecord
  has_many :dish_ingredients
  has_many :dishes, through: :dish_ingredients

  def self.total_calories
    sum(:calories)
  end

  def self.top_ingredients
    select("ingredients.*, count(*)").joins(:dish_ingredients).group(:id).order(count: :desc).limit(3)
  end

  def self.unique_ingredients
    distinct
  end
end
