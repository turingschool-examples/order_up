class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def distinct_ingredients
    dishes.flat_map do |dish|
      dish.ingredients
    end.uniq
  end
end
