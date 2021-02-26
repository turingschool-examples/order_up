class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def used_ings
    dishes.flat_map do |dish|
      dish.ingredients.map do |ing|
        ing.name
      end
    end
  end
end
