class Dish < ApplicationRecord
  validates_presence_of :name, :description
  belongs_to :chef
  has_many :dish_ingredients
  has_many :ingredients, through: :dish_ingredients

  def chefs_name
    chef.name
  end

  def total_calories
    ingredients
    .joins(:dish_ingredients)
    .distinct
    .sum("ingredients.calories * dish_ingredients.quantity")
  end

  # def total_calories(dish)
  # self.joins(dish_ingredients: :ingredient)
  # .select("dishes.name, sum(ingredients.calories * dish_ingredients.quantity) AS calorie_total")
  # .where(id: "#{dish.id}")
  # .group(:id)
  # (group(:id)).calorie_total
end
