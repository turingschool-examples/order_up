class Dish <ApplicationRecord
  validates_presence_of :name, :description
  belongs_to :chef
  has_many :ingredients

  def calorie_count
    @calories = self.ingredients.sum(:calories)
  end
end
