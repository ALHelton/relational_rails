require 'rails_helper'

RSpec.describe 'Update Palette' do
  let!(:palette) { Palette.create!(name: "Professional Watercolor", brand: "Windsor & Newton", cartridge_capacity: 24, recyclable: true) }

  describe 'As a visitor' do
    describe 'When I visit the Update Palette form by clicking a link on the palette show page' do
      it 'I can update Palette attributes' do
        visit "/palettes/#{palette.id}"

        click_link "Update Palette"

        expect(current_path).to eq("/palettes/#{palette.id}/edit")
        
        fill_in 'Name', with: 'Expanded Watercolor'
        fill_in 'Brand', with: "Old Holland"
        fill_in 'Cartridge Capacity', with: 42
        fill_in 'Recyclable', with: false

        click_button "Submit"

        expect(current_path).to eq("/palettes/#{palette.id}")
        expect(page).to have_content('Expanded Watercolor')

        visit "/palettes/#{palette.id}"
        expect(page).to have_content('Expanded Watercolor')
        expect(page).to have_content(42)
      end
    end
  end
end