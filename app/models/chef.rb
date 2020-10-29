class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def chefs_ingredients
    dishes.joins(:ingredients).distinct.pluck('ingredients.name')
  end

  def popular_ingredients
    dishes.joins(:ingredients).select('ingredients.name, count(*)').group('ingredients.name').order('count(*) desc').limit(3)
  end
end
