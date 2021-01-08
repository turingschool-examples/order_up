class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes, dependent: :destroy
  has_many :ingredients, through: :dishes

  def unique_ingredients
    ingredients.distinct
  end

  def top_3_ingredients
    ingredients.select('ingredients.*, count(dishes) AS count').group(:id).order('count DESC').limit(3)
  end

end
