class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def ingredients
    dishes.flat_map do |dish|
      dish.ingredients.pluck(:name)
    end.sort.uniq
  end
end
