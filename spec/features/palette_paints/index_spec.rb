require 'rails_helper'

RSpec.describe 'Palettes index page' do
  before do
    Palette.destroy_all
    Paint.destroy_all
  end

  let!(:palette) { Palette.create!(name: "Professional Watercolor", brand: "Windsor & Newton", cartridge_capacity: 24, recyclable: true) }
  let!(:palette_2) { Palette.create!(name: "Professional Goache", brand: "Windsor & Newton", cartridge_capacity: 12, recyclable: false) }

  let!(:paint) { Paint.create!(paint_name: "Alizarin Crimson", medium: "Watercolor", series: 1, opaque: false, palette_id: palette.id) }
  let!(:paint_2) { Paint.create(paint_name: "French Ultramarine", medium: "Watercolor", series: 2, opaque: false, palette_id: palette.id) }
  let!(:paint_3) { Paint.create(paint_name: "Permanent Sap Green", medium: "Watercolor", series: 1, opaque: false, palette_id: palette.id) }
  let!(:paint_4) { Paint.create(paint_name: "Orange Lake Deep", medium: "Gouache", series: 1, opaque: true, palette_id: palette_2.id) }
  let!(:paint_5) { Paint.create(paint_name: "Oxide of Chromium", medium: "Gouache", series: 2, opaque: false, palette_id: palette_2.id) }

  it 'displays all palette paints and their attributes' do
    visit "/palettes/#{palette.id}/paints"

    expect(page).to have_content(paint.paint_name)
    expect(page).to have_content(paint.medium)
    expect(page).to have_content(paint.series)
    expect(page).to have_content(paint.opaque)
    expect(page).to have_content(paint.palette_id)

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
  end
end