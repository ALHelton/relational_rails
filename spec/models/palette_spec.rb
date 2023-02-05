require 'rails_helper.rb'

RSpec.describe Palette do
  it {should have_many :paints}
end