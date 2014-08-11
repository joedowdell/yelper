require 'rails_helper'

describe 'restaurants' do

  context 'no restaurants have been added' do
		it 'should display a prompt to add a restaurant' do
      visit '/restaurants'
      expect(page).to have_content 'No restaurants yet'
      expect(page).to have_link 'Add a restaurant'
    end
  end

	context 'have been added' do
		before(:each) do
			Restaurant.create(name: 'Nandos') 
		end
		
		it 'should display them' do
			visit '/restaurants'
			expect(page).to have_content 'Nandos'
		end
	end

	context 'creating restaurants' do
		
		it 'prompts the user to fill out a form, then display new restaurant' do
			visit '/restaurants'
			click_link 'Add a restaurant'

			fill_in 'Name', with: 'Chipotle'
			click_button 'Create Restaurant'

			expect(page).to have_content 'Chipotle'
			expect(current_path).to eq '/restaurants'
		end

	end

	context 'edit restaurants' do
		before(:each) do
			Restaurant.create(name: 'Chilpotle') 
		end

		it 'prompts the user to fill out a form, then display edited restaurant' do
			visit '/restaurants'
			click_link 'Edit Chipotle'

			fill_in 'Name', with: 'Chipotle'
			click_button 'Update Restaurant'

			expect(page).to have_content 'Chipotle'
			expect(current_path).to eq '/restaurants'

		end

	end

	context 'delete restaurant' do

		it 'removes restaurant when a user clicks a delete link' do
			visit '/restaurants'
			click_link 'Delete Chipotle'

			expect(page).not_to have_content 'Chipotle'
			expect(page).to have_content 'Restaurant deleted successfully'
		end

	end




end


