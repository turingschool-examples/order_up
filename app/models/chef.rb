class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes
  has_many :ingredients, through: :dishes
  
  def top_three_ingredients
    ingredients
    .select('ingredients.*, count(ingredients) as ingred_usage')
    .group(:id)
    .order('ingred_usage desc')
    .limit(3)
  end
end
  