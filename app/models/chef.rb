class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes, dependent: :destroy
  has_many :ingredients, through: :dishes

  def top_three
    ingredients
      .select('ingredients.name, count(ingredients.name) as ingredient_count')
      .group('ingredients.name')
      .order(ingredient_count: :desc)
      .limit(3)
  end
end
