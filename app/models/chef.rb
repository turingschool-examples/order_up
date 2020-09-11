class Chef < ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def popular_ingredients
    dishes.order(:ingredients).limit(3).pluck(:name)
  end

end
