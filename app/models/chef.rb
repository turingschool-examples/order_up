class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes
  has_many :ingredients, through: :dishes

  def popular_ingredients
    ingredients
    # .includes(:dishes)
    .select('ingredients.name','ingredients.id', 'count(ingredients.id) AS total')
    .where('dish_ingredients.ingredient_id = ingredients.id')
    .group('ingredients.id')
    .order(total: :desc)
    .limit(3)
  end
end
