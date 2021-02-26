class Ingredient < ApplicationRecord
  has_many :dish_ingredients
  has_many :dishes, through: :dish_ingredients
  has_many :chefs, through: :dishes

  validates_presence_of :name

  def self.popular_ingredients_by_chef(chef_id)
    joins(:chefs)
    .select('ingredients.*, count(ingredients.id) as ingredient_count')
    .where(chefs: {id: chef_id})
    .group('ingredients.id')
    .order(ingredient_count: :desc)
    .limit(3)
  end
end
