require 'rails_helper'

RSpec.describe 'Palettes index page' do
  before do
    Palette.destroy_all
    Paint.destroy_all
  end

  let!(:palette) { Palette.create!(name: "Professional Watercolor", brand: "Windsor & Newton", cartridge_capacity: 24, recyclable: true) }
  let!(:palette_2) { Palette.create!(name: "Professional Goache", brand: "Windsor & Newton", cartridge_capacity: 12, recyclable: false) }

  describe 'User Story 1' do
    it 'displays all Palette names' do

      visit "/palettes"

      expect(page).to have_content(palette.name)
      expect(page).to have_content(palette.created_at)

      expect(page).to have_content(palette_2.name)
      expect(page).to have_content(palette_2.created_at)
    end
  end

  describe 'User Story 6' do
    it 'displays palette names in descending order' do

      visit "/palettes"

      expect(palette_2.name).to appear_before(palette.name)
    end
  end

  describe 'User Story 8' do
    it 'displays paints index at the top of page' do
      visit "/palettes"

      click_on "All Paints"

      expect(current_path).to eq("/paints")
    end
  end

  describe 'User Story 17' do
    it 'displays an edit link next to each Palette' do
      visit "/palettes"

      expect(page).to have_link("Edit")

      first(:link, "Edit").click
      # palette_2 comes before palette on page in test data
      expect(current_path).to eq("/palettes/#{palette_2.id}/edit")
    end
  end
end