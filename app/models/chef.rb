class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes
  has_many :ingredients, through: :dishes

  def favorite_ingredients
    dishes.joins(:ingredeints)
    .group("ingredeints.id")
    .select("ingredeints.*, count('ingredeint.name') as top_three")
    .order(top_three: :desc)
    .limit(3)
  end
end
