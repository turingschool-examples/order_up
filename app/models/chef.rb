class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  has_many :ingredients, through: :dishes

  def top_three_ingredients
    self.ingredients.select('ingredients.name, COUNT(ingredients.name) as count').group("ingredients.name").order(count: :desc).limit(3)
  end
end
