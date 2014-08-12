require 'rails_helper'

describe 'creating restaurants' do 

	context 'a valid restaurant' do
		
		it 'prompts the user to fill out a form, then display new restaurant' do
			visit '/restaurants'
			click_link 'Add a restaurant'

			fill_in 'Name', with: 'Chipotle'
			click_button 'Create Restaurant'

			expect(page).to have_content 'Chipotle'
			expect(current_path).to eq restaurants_path
		end

	end

	context 'a invalid restaurant' do
		it 'shows an error because of an uncapitalised name that is too short' do
			visit '/restaurants'
			click_link 'Add a restaurant'
			fill_in 'Name', with: 'ab'

			click_button 'Create Restaurant'
			expect(page).not_to have_css 'h2', text: 'ab'
			expect(page).to have_content 'errors'
		end
	end
	
end