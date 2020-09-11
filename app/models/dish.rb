class Dish <ApplicationRecord
  validates_presence_of :name, :description
  has_many :recipes
  has_many :ingredients, through: :recipes

  belongs_to :chef

  def calorie_count
    self.ingredients.sum(:calories)
  end
end
