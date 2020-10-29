class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes
  has_many :ingredients, through: :dishes

  def unique_ingredients
    ingredients.distinct
  end

  def popular_ingredients
    ingredients.joins(:dishes).group(:id).order('COUNT(dishes.id) DESC').limit(3)

    # By number of times an ingredient appears, not how many dishes have that ingredient.
    # ingredients.group(:id).order('COUNT(ingredients.id) DESC').limit(3)
  end
end
