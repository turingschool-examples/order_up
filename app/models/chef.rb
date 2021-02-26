class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def chefs_ingredients
    dishes.select('dishes.*, ingredients.name').joins(:ingredients).distinct
  end
end
