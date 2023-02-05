require 'rails_helper.rb'

RSpec.describe Palette do
  it {should have_many :paints}

  describe 'instance methods' do
    describe '#paint_count' do
      before :each do
        @palette = Palette.create!(name: "Professional Watercolor", brand: "Windsor & Newton", cartridge_capacity: 24, recyclable: true)
        @paint_1 = @palette.paints.create!(paint_name: "Alizarin Crimson", medium: "Watercolor", series: 1, opaque: false, palette_id: @palette.id)
        @paint_2 = @palette.paints.create!(paint_name: "Yellow Ochre", medium: "Watercolor", series: 1, opaque: true, palette_id: @palette.id)
      end
      
      it 'returns the count of palette paints' do
        expect(@palette.paint_count).to eq(2)
      end
    end
  end
end