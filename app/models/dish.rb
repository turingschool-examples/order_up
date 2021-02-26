class Dish <ApplicationRecord
  validates_presence_of :name, :description
  belongs_to :chef

  has_many :recipes
  has_many :ingredients, through: :recipes


  def calorie_count
    ingredients.sum(:calories)
  end
end
