require 'rails_helper'

RSpec.describe 'New Palette Paint' do

  let!(:palette) { Palette.create!(name: "Professional Watercolor", brand: "Windsor & Newton", cartridge_capacity: 24, recyclable: true) }
  let!(:palette_2) { Palette.create!(name: "Professional Goache", brand: "Windsor & Newton", cartridge_capacity: 12, recyclable: false) }

  describe 'user story 13' do
    describe 'When I visit a Palette paints Index page' do
      it 'I see a link to add a new paint for that palette that leads to a form page' do
        visit "/palettes/#{palette.id}/paints"
        
        click_link('Create Paint')

        expect(current_path).to eq("/palettes/#{palette.id}/paints/new")
      end

      it 'when I submit form, I am redirected to palette_paint index with new paint listed' do
        visit "/palettes/#{palette.id}/paints/new"

        fill_in 'Paint Name', with: 'Antwerp Blue'
        fill_in 'Medium', with: 'Watercolor'
        fill_in 'Series', with: 1
        fill_in 'Opaque', with: false

        click_button 'Create Paint'

        expect(current_path).to eq("/palettes/#{palette.id}/paints")
        expect(page).to have_content("Antwerp Blue")
        expect(page).to have_content("Watercolor")
        expect(page).to have_content(1)
        expect(page).to have_content('false')
      end
    end
  end
end