class Dish <ApplicationRecord
  validates_presence_of :name, :description
  belongs_to :chef
  has_many :recipes
  has_many :ingredients, through: :recipes

  def chefs_name
    chef.name
  end

  def self.total_calories(dish)
    joins(recipes: :ingredient)
    .select("dishes.name, sum(ingredients.calories * recipes.ingredient_quantity) AS calorie_total")
    .where(id: "#{dish.id}")
    .group(:id)
    .first.calorie_total
  end
end

