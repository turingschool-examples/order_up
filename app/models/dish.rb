class Dish <ApplicationRecord
  validates_presence_of :name, :description
  belongs_to :chef
  has_many :dishes_ingredients
  has_many :ingredients, through: :dishes_ingredients

  def calorie_count
    ingredients.sum(:calories)
  end

  def self.ingredients
    joins(:ingredients).distinct('ingredients.name').pluck('ingredients.name')
  end

end
