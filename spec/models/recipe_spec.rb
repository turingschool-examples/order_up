require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe "Relationships" do
    it { should belong_to :dish }
    it { should belong_to :ingredient }
  end
end
