require "rails_helper"

describe Recipe, type: :model do
  describe "relationships" do
    it { should belong_to :dish }
    it { should belong_to :recipe }
  end
end
