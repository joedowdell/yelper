require 'rails_helper'

describe 'reviewing restaurants' do

	before(:each) do
			Restaurant.create(name: 'Nandos') 
		end
		
	it 'allows users to leave reviews using a form, which appears alongside' do
		visit '/restaurants'
		click_link 'Review Nandos'
		fill_in 'Thoughts', with: 'Alright!'
		select '3', from: 'Rating'
		click_button 'Leave review'

		expect(current_path).to eq restaurants_path
		expect(page).to have_content 'Alright! (3)'
	
	end

end