class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  has_many :ingredients, through: :dishes

  def distinct_ingredients
    ingredients.distinct
  end

  def top_ingredients
    ingredients.group('ingredients.id').order('COUNT(ingredients.id)').limit(3)
    #so close but gonna stop here
  end
end
