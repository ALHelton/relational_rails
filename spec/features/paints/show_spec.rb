# require 'rails_helper'

# RSpec.describe 'Paints show page' do
#   it 'displays paint name' do
#     palette = Palette.create!(name: "Professional Watercolor", brand: "Windsor & Newton", cartridge_capacity: 24, recyclable: true)
#     palette_2 = Palette.create!(name: "Professional Goache", brand: "Windsor & Newton", cartridge_capacity: 12, recyclable: false)
  

#     paint = Paint.create!(paint_name: "Alizarin Crimson", medium: "Watercolor", series: 1, opaque: false, palettes_id: palette.id)

#     paint_2 = Paint.create!(paint_name: "Perylene Black", medium: "Gouache", series: 3, opaque: true, palettes_id: palette_2.id)


#     visit "/paints/#{paint.id}"
#     # expect(page).to have_content(paint.paint_name)

#     visit "/paints/#{paint_2.id}"
#     # expect(page).to have_content(paint_2.paint_name)
#   end
# end