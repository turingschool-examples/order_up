class Dish <ApplicationRecord
  belongs_to :chef
  has_many :dish_ingredients
  has_many :ingredients, through: :dish_ingredients

  validates_presence_of :name, :description

  def calorie_count
    # attempting AR call.... lots of errors... I need to work on many to many AR calls
    # I really want to use .sum - I am having trouble accessing the information I want using AR calls/queries/aggregate methods
    ingredients.select(:calories).pluck(:calories).sum(&:to_f)
  end
end
