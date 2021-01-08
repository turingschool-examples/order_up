class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes
  has_many :ingredients,->{select("distinct ingredients.*")}, through: :dishes

  delegate :top_ingredients, to: :ingredients
end
