require 'rails_helper'

RSpec.describe 'New Palette' do
  describe 'User Story 11' do
    describe 'When I visit the new Palette form by clicking a link on the index' do
      it 'I can create a new palette' do
        visit '/palettes'

        click_link('New Palette')

        expect(current_path).to eq('/palettes/new')

      end

      it 'after creating palette, redirected to palette index with new record shown' do
        visit '/palettes/new'

        fill_in 'Name', with: "Mixed-media Travel Tin"
        fill_in 'Brand', with: "Qor"
        fill_in 'Cartridge Capacity', with: 12
        fill_in 'Recyclable', with: true

        click_button "Create Palette"

        expect(current_path).to eq("/palettes")
        expect(page).to have_content("Mixed-media Travel Tin")
      end
    end
  end
end