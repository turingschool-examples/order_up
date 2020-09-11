class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def all_ingredients
    dishes.select('dishes.*, ingredients.*').joins(:ingredients).distinct.pluck('ingredients.name')
  end
end
