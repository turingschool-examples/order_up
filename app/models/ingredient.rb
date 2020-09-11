class Ingredient <ApplicationRecord
  validates_presence_of :name
  has_many :dishes, through: :dish_ingredients

end
