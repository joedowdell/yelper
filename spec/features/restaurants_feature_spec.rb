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



	context 'edit restaurants' do
		before(:each) do
			Restaurant.create(name: 'Chilpotle')
			joe = User.create(email: "a@a.com", password: "12345678", password_confirmation: "12345678")
      login_as joe 
		end

		it 'prompts the user to fill out a form, then display edited restaurant' do
			visit '/restaurants'
			click_link 'Edit Chilpotle'

			fill_in 'Name', with: 'Chipotle'
			click_button 'Update Restaurant'

			expect(page).to have_content 'Chipotle'
			expect(current_path).to eq restaurants_path

		end

	end

	context 'deleting restaurant' do
		before(:each) do
      Restaurant.create(name: 'Chipotle')
      joe = User.create(email: "a@a.com", password: "12345678", password_confirmation: "12345678")
      login_as joe
    end

		it 'removes restaurant when a user clicks a delete link' do
			visit '/restaurants'
			click_link 'Delete Chipotle'

			expect(page).not_to have_content 'Chipotle'
			expect(page).to have_content 'Restaurant deleted successfully'
		end

	end

end


