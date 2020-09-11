class Chef < ApplicationRecord
  validates_presence_of :name

  has_many :dishes

  def unique_names

  end

end
