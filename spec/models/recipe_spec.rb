require "rails_helper"

describe Recipe, type: :model do
  describe "relationiships" do
    it {should belong_to :dish}
    it {should belong_to :ingredient}
  end
end
