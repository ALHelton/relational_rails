require 'rails_helper'

RSpec.describe 'Paints index page' do

  before do
    Palette.destroy_all
    Paint.destroy_all
  end

  let!(:palette) { Palette.create(name: "Professional Watercolor", brand: "Windsor & Newton", cartridge_capacity: 24, recyclable: true) }
  let!(:palette_2) { Palette.create(name: "Professional Gouache", brand: "Windsor & Newton", cartridge_capacity: 12, recyclable: false) }


  let!(:paint) { Paint.create!(paint_name: "Alizarin Crimson", medium: "Watercolor", series: 1, opaque: true, palette_id: palette.id) }
  let!(:paint_2) { Paint.create!(paint_name: "Perylene Black", medium: "Gouache", series: 3, opaque: true, palette_id: palette_2.id) }
  let!(:paint_3) { Paint.create!(paint_name: "Spectrum Violet", medium: "Gouache", series: 1, opaque: true, palette_id: palette_2.id) }
  let!(:paint_4) { Paint.create!(paint_name: "Permanent Sap Green", medium: "Watercolor", series: 1, opaque: false, palette_id: palette_2.id) }


  describe 'User Story 4' do
    it 'displays paint name and attributes' do
      visit "/paints"

      expect(page).to have_content(paint.paint_name)
      expect(page).to have_content(paint.medium)
      expect(page).to have_content(paint.series)
      expect(page).to have_content(paint.opaque)
      expect(page).to have_content(paint.palette_id)
    end
  end

  describe 'User Story 9' do
    it 'displays palettes index at the top of page' do
      visit "/paints"

      click_on "All Palettes"

      expect(current_path).to eq("/palettes")
    end
  end

  describe 'User Story 15' do
    it 'On Paints index page, it only shows paints with true value for opaque' do
      visit "/paints"

      expect(page).to have_content(paint_2.paint_name)
      expect(page).to have_content(paint_2.medium)
      expect(page).to have_content(paint_2.series)
      expect(page).to have_content(paint_2.opaque)
      expect(page).to have_content(paint_2.palette_id)

      expect(page).to have_content(paint_3.paint_name)
      expect(page).to have_content(paint_3.medium)
      expect(page).to have_content(paint_3.series)
      expect(page).to have_content(paint_3.opaque)
      expect(page).to have_content(paint_3.palette_id)

      expect(page).to_not have_content(paint_4.paint_name)
      expect(page).to_not have_content(paint_4.opaque)
    end
  end

  describe 'User Story 18' do
    it 'Next to each paint, there is an edit link that takes you to paint edit page' do
      visit "/paints"

      expect(page).to have_link("Edit")

      first(:link, "Edit").click
      expect(current_path).to eq("/paints/#{paint.id}/edit")
    end
  end

  describe 'User Story 23' do
    it 'displays Delete Paint link, removes the paint from the paints index page' do
      visit "/paints"

      first(:link, "Delete").click

      expect(current_path).to eq("/paints")
      expect(page).to_not have_content(paint.paint_name)
    end
  end

  describe 'index paint name display links' do
    it 'name of paint links to that paint`s show page' do
      visit "/paints"

      expect(page).to have_link("#{paint.paint_name}")

      click_link "#{paint.paint_name}"

      expect(current_path).to eq("/paints/#{paint.id}")
    end
  end
end