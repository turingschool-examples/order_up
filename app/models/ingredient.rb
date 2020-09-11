class Ingredient <ApplicationRecord
  validates_presence_of :name, :calories
  has_many :dishes_ingredients
  has_many :dishes, through: :dishes_ingredients

end
