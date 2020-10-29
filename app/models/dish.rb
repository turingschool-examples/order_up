class Dish <ApplicationRecord
  has_many :dish_ingredients
  has_many :ingredients, through: :dish_ingredients

  validates_presence_of :name, :description
  belongs_to :chef

  def total_calories
    self.ingredients.sum(:calories)
  end
end
