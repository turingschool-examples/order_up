class Dish <ApplicationRecord
  validates_presence_of :name, :description
  belongs_to :chef
  has_many :recipes
  has_many :ingredients, through: :recipes

  def chefs_name
    chef.name
  end

  def total_calories
    ingredients
    .joins(:recipes)
    .distinct
    .sum("ingredients.calories * recipes.ingredient_quantity")
  end
end

