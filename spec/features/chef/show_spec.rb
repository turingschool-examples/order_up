require 'rails_helper'

RSpec.describe 'chef show page' do
  describe 'As a visiter' do
    it 'has the chef name' do
      chef = Chef.create!(name: "Chef guy")
      visit "/chef/#{chef.id}"
    end
  end
end
