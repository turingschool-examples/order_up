class Ingredient <ApplicationRecord
  validates_presence_of :name, :calories
  has_many :components
  has_many :dishes, through: :components
end