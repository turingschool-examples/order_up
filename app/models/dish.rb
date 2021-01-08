class Dish <ApplicationRecord
  validates_presence_of :name, :description
  belongs_to :chef
  has_many :components
  has_many :ingredients, through: :components

  def total_calories
    totals = self.ingredients.joins(:components).select("sum(ingredients.calories * components.amount) as total").group("ingredients.id")
    totals.first.total
  end
end
