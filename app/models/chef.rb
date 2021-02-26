class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def list_unique_ingredients_used
    # binding.pry I ran out of time finish this method.
  end
end
