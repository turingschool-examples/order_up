class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  has_many :ingredients, through: :dishes

  def top_three_ingredients
    self.ingredients.joins(:dish_ingredients).select('ingredients.*, COUNT(ingredients.id) as count')
  end
end
