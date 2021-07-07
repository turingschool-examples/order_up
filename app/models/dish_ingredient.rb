class DishIngredient <ApplicationRecord
  validates_presence_of :dish_id, :ingredient_id
  has_many :dishes
  has_many :ingredients

end
