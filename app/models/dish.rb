class Dish <ApplicationRecord
  validates_presence_of :name, :description
  belongs_to :chef
  has_many :recipies
  has_many :dishes, through: :recipies
end
