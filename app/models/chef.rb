class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def all_ingredients
    binding.pry
    dish.joins(:ingredients).pluck("ingredient.name")
  end
end
