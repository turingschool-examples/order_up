class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def ingredients # if i have time refactor to call dishes.ingrediensts (put the work on the dishes model)
    dishes.joins(:ingredients).group('ingredients.id').select('ingredients.name').pluck('ingredients.name')
  end
end
