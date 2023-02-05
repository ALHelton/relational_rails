require 'rails_helper'

RSpec.describe 'Paints index page' do

  before do
    Palette.destroy_all
    Paint.destroy_all
  end

  let!(:palette) { Palette.create!(name: "Professional Watercolor", brand: "Windsor & Newton", cartridge_capacity: 24, recyclable: true) }

  let!(:paint) { Paint.create!(paint_name: "Alizarin Crimson", medium: "Watercolor", series: 1, opaque: false, palette_id: palette.id) }


  it 'displays paint name and attributes' do
    visit "/paints"

    expect(page).to have_content(paint.paint_name)
    expect(page).to have_content(paint.medium)
    expect(page).to have_content(paint.series)
    expect(page).to have_content(paint.opaque)
    expect(page).to have_content(paint.palette_id)
  end

  it 'displays palettes index at the top of page' do
    visit "/paints"

    click_on "All Palettes"

    expect(current_path).to eq("/palettes")
  end
end