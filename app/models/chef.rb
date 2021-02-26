class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes
  has_many :ingredients, through: :dishes

  def all_ingredients_used
    ingredients.distinct('ingredients.id').order('ingredients.name').pluck('ingredients.name')
  end
end
