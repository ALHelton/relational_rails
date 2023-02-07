require 'rails_helper'

RSpec.describe 'Update Paint' do

  before do
    Palette.destroy_all
    Paint.destroy_all
  end

  let!(:palette) { Palette.create!(name: "Professional Watercolor", brand: "Windsor & Newton", cartridge_capacity: 24, recyclable: true) }
  let!(:paint) { Paint.create!(paint_name: "Alizarin Crimson", medium: "Watercolor", series: 1, opaque: false, palette_id: palette.id) }

    describe 'User Story 14' do
      it 'on the Paints edit page - Fill out the form, submit, paint is updated on show page' do
        visit "/paints/#{paint.id}/edit"

        fill_in 'Paint Name', with: 'Bismuth Yellow'
        fill_in 'Medium', with: 'Gouache'
        fill_in 'Series', with: '1'
        fill_in 'Opaque', with: 'true'

        click_button "Update Paint"

        expect(current_path).to eq("/paints/#{paint.id}")

        expect(page).to have_content('Bismuth Yellow')
        expect(page).to have_content('Gouache')
        expect(page).to have_content('1')
        expect(page).to have_content('true')
      end
    end
end