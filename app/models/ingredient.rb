class Ingredient <ApplicationRecord
  validates_presence_of :name, :calories
  has_many :ingredient_dishes
  has_many :dishes, through: :ingredient_dishes
end
