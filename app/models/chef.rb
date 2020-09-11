class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def popular_ingredients
    # binding.pry
  end
end
