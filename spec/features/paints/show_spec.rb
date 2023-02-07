require 'rails_helper'

RSpec.describe 'Paints show page' do
  before do
    Palette.destroy_all
    Paint.destroy_all
  end

  let!(:palette) { Palette.create!(name: "Professional Watercolor", brand: "Windsor & Newton", cartridge_capacity: 24, recyclable: true) }
  let!(:palette_2) { Palette.create!(name: "Professional Goache", brand: "Windsor & Newton", cartridge_capacity: 12, recyclable: false) }
  
  let!(:paint) { Paint.create!(paint_name: "Alizarin Crimson", medium: "Watercolor", series: 1, opaque: false, palette_id: palette.id) }
  let!(:paint_2) { Paint.create!(paint_name: "Perylene Black", medium: "Gouache", series: 3, opaque: true, palette_id: palette_2.id) }


  describe 'User Story 4' do
    it 'displays paint name and attributes' do

      visit "/paints/#{paint.id}"
      expect(page).to have_content(paint.paint_name)
      expect(page).to have_content(paint.medium)
      expect(page).to have_content(paint.series)
      expect(page).to have_content(paint.opaque)
      expect(page).to have_content(paint.palette_id)
      expect(page).to_not have_content(paint_2.paint_name)
      # expect(page).to_not have_content(paint_2.medium)
      # # expect(page).to_not have_content(paint_2.series)
      # expect(page).to_not have_content(paint_2.opaque)
      # expect(page).to_not have_content(paint_2.palette_id)

      visit "/paints/#{paint_2.id}"
      expect(page).to have_content(paint_2.paint_name)
      expect(page).to have_content(paint_2.medium)
      expect(page).to have_content(paint_2.series)
      expect(page).to have_content(paint_2.opaque)
      expect(page).to have_content(paint_2.palette_id)
      expect(page).to_not have_content(paint.paint_name)
      # expect(page).to_not have_content(paint.medium)
      # expect(page).to_not have_content(paint.series)
      # expect(page).to_not have_content(paint.opaque)
      # expect(page).to_not have_content(paint.palette_id)
    end
  end

  describe 'User Story 14' do
    it 'I see a link to update paint on paint show page' do
      visit "/paints/#{paint.id}"

      click_link 'Update Paint'

      expect(current_path).to eq("/paints/#{paint.id}/edit")
    end
  end
end