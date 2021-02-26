class Dish <ApplicationRecord
  validates_presence_of :name, :description
  belongs_to :chef

  def chefs_name
    chef.name
  end
end
