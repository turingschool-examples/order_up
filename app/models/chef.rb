class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes
  # has_many :dish_ingredients, through: :dishes
end
