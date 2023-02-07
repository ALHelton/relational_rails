require 'rails_helper'

RSpec.describe 'Palettes show page' do
  
  before do
    Palette.destroy_all
    Paint.destroy_all
  end

  let!(:palette) { Palette.create!(name: "Professional Watercolor", brand: "Windsor & Newton", cartridge_capacity: 24, recyclable: true) }
  let!(:palette_2) { Palette.create!(name: "Professional Goache", brand: "Windsor & Newton", cartridge_capacity: 12, recyclable: false) }

  describe 'User Story 2' do
    it 'displays palette name and attributes' do

      visit "/palettes/#{palette.id}"
      expect(page).to have_content(palette.name)
      expect(page).to have_content(palette_2.paint_count)
      expect(page).to have_content(palette.brand)
      expect(page).to have_content(palette.cartridge_capacity)
      expect(page).to have_content(palette.recyclable)

      expect(page).to_not have_content(palette_2.name)
      expect(page).to_not have_content(palette_2.cartridge_capacity)
      expect(page).to_not have_content(palette_2.recyclable)
      # page will have same brand name for both palettes

      visit "/palettes/#{palette_2.id}"
      expect(page).to have_content(palette_2.name)
      expect(page).to have_content(palette_2.paint_count)
      expect(page).to have_content(palette_2.brand)
      expect(page).to have_content(palette_2.cartridge_capacity)
      expect(page).to have_content(palette_2.recyclable)

      expect(page).to_not have_content(palette.name)
      expect(page).to_not have_content(palette.cartridge_capacity)
      expect(page).to_not have_content(palette.recyclable)
    end
  end

  describe 'User Story 5' do
    it 'displays the palette paints index page' do
      visit "/palettes/#{palette.id}"

      click_on "Paints for #{palette.name}"

      expect(current_path).to eq("/palettes/#{palette.id}/paints")
    end
  end
end