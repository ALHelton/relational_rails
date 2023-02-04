require 'rails_helper'

RSpec.describe 'Palettes show page' do
  
  before do
    Palette.destroy_all
    Paint.destroy_all
  end

  it 'displays palette name' do
    palette = Palette.create!(name: "Professional Watercolor", brand: "Windsor & Newton", cartridge_capacity: 24, recyclable: true)
    palette_2 = Palette.create!(name: "Professional Goache", brand: "Windsor & Newton", cartridge_capacity: 12, recyclable: false)
  
    visit "/palettes/#{palette.id}"
    expect(page).to have_content(palette.name)

    visit "/palettes/#{palette_2.id}"
    expect(page).to have_content(palette_2.name)
  end
end