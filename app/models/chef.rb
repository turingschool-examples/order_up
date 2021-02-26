class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes, dependent: :destroy

  def chef_ingredients
    dishes.joins(:ingredients).select('ingredients.*')
  end

end
