require 'rails_helper.rb'

RSpec.describe Paint do
  it {should belong_to :palette}
end