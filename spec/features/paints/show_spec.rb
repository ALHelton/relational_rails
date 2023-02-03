require 'rails_helper'

RSpec.describe 'Paints show page' do
  it 'displays paint name and attributes' do
    palette = Palette.create!(name: "Professional Watercolor", brand: "Windsor & Newton", cartridge_capacity: 24, recyclable: true)
    palette_2 = Palette.create!(name: "Professional Goache", brand: "Windsor & Newton", cartridge_capacity: 12, recyclable: false)
  

    paint = Paint.create!(paint_name: "Alizarin Crimson", medium: "Watercolor", series: 1, opaque: false, palettes_id: palette.id)

    paint_2 = Paint.create!(paint_name: "Perylene Black", medium: "Gouache", series: 3, opaque: true, palettes_id: palette_2.id)


    visit "/paints/#{paint.id}"
    expect(page).to have_content(paint.paint_name)
    expect(page).to have_content(paint.medium)
    expect(page).to have_content(paint.series)
    expect(page).to have_content(paint.opaque)
    expect(page).to have_content(paint.palettes_id)
    expect(page).to_not have_content(paint_2.paint_name)
    expect(page).to_not have_content(paint_2.medium)
    expect(page).to_not have_content(paint_2.series)
    expect(page).to_not have_content(paint_2.opaque)
    expect(page).to_not have_content(paint_2.palettes_id)

    visit "/paints/#{paint_2.id}"
    expect(page).to have_content(paint_2.paint_name)
    expect(page).to have_content(paint_2.medium)
    expect(page).to have_content(paint_2.series)
    expect(page).to have_content(paint_2.opaque)
    expect(page).to have_content(paint_2.palettes_id)
    expect(page).to_not have_content(paint.paint_name)
    expect(page).to_not have_content(paint.medium)
    expect(page).to_not have_content(paint.series)
    expect(page).to_not have_content(paint.opaque)
    expect(page).to_not have_content(paint.palettes_id)
  end
end