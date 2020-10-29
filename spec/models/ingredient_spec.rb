require 'rails_helper'

describe 'validations' do
  it { should validate_presence_of :name }
  it { should validate_presence_of :calories }
end

describe 'relationships' do
  it { should have_many :recipes }
  it { should have_many :dishes.through(:recipes) }
end
