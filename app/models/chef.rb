class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes
  has_many :recipes, through: :dishes
  has_many :ingredients, through: :recipes
end
