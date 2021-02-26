class Chef < ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def find_unique_ingredients
    dishes
    .joins(:ingredients)
    .select('ingredients.*')
    .distinct
  end

  def most_popular_ingredients
    dishes
    .joins(:ingredients)
    .select('ingredients.name, count(*) AS ingredient_count')
    .group('ingredients.id')
    .order('ingredient_count DESC')
    .limit(3)
  end
end
