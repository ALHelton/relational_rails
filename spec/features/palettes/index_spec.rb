require 'rails_helper'

RSpec.describe 'Palettes index page' do
  before do
    Palette.destroy_all
    Paint.destroy_all
  end

  let!(:palette) { Palette.create!(name: "Professional Watercolor", brand: "Windsor & Newton", cartridge_capacity: 24, recyclable: true) }
  let!(:palette_2) { Palette.create!(name: "Professional Goache", brand: "Windsor & Newton", cartridge_capacity: 12, recyclable: false) }

  it 'displays all Palette names' do

    visit "/palettes"

    expect(page).to have_content(palette.name)
    expect(page).to have_content(palette.created_at)

    expect(page).to have_content(palette_2.name)
    expect(page).to have_content(palette_2.created_at)
  end

  it 'displays palette names in descending order' do

    visit "/palettes"

    expect(palette_2.name).to appear_before(palette.name)
  end

  it 'displays paints index at the top of page' do
    visit "/palettes"

    click_on "Paints Index"

    expect(current_path).to eq("/paints")
  end

end