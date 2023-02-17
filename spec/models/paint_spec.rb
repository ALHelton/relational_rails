require 'rails_helper'

RSpec.describe Paint do
  it {should belong_to :palette}

  let!(:palette) { Palette.create(name: "Professional Watercolor", brand: "Windsor & Newton", cartridge_capacity: 24, recyclable: true) }
  let!(:palette_2) { Palette.create(name: "Professional Gouache", brand: "Windsor & Newton", cartridge_capacity: 12, recyclable: false) }


  let!(:paint) { Paint.create!(paint_name: "Alizarin Crimson", medium: "Watercolor", series: 1, opaque: false, palette_id: palette.id) }
  let!(:paint_2) { Paint.create!(paint_name: "Perylene Black", medium: "Gouache", series: 3, opaque: true, palette_id: palette_2.id) }
  let!(:paint_3) { Paint.create!(paint_name: "Spectrum Violet", medium: "Gouache", series: 1, opaque: true, palette_id: palette_2.id) }
  let!(:paint_4) { Paint.create!(paint_name: "Cerulean Blue", medium: "Watercolor", series: 3, opaque: false, palette_id: palette_2.id) }
  
  describe 'Class Methods' do

    describe 'User Story 15' do
      describe '::true_opaque' do
        it 'shows all paints with true opacity value' do
          expect(Paint.true_opaque).to eq([paint_2, paint_3])
        end
      end
    end

    describe 'User Story 16' do
      describe '::sort_alpha' do
        it 'orders all paints alphabetically' do
          expect(Paint.sort_alpha).to eq([paint, paint_4, paint_2, paint_3])
        end
      end
    end

    describe 'User Story 21' do
      describe '::series_filter' do
        it 'Only returns records with more than `number` of `column_name`' do
          expect(Paint.series_filter(2)).to eq([paint_2, paint_4])
        end
      end
    end
  end
end