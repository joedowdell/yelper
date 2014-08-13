require 'rails_helper'


describe 'reviewing restaurants' do

	before(:each) do
			Restaurant.create(name: 'Nandos') 
		end
		
	it 'allows users to leave reviews using a form, which appear alongside restaurants' do
		visit '/restaurants'
		click_link 'Review Nandos'
		fill_in 'Thoughts', with: 'Alright!'
		select '3', from: 'Rating'
		click_button 'Leave review'

		expect(current_path).to eq restaurants_path
		expect(page).to have_content 'Alright! (★★★☆☆)'
	
	end

	it 'display the average rating from all reviews' do

		leave_review('So so', 3)
		leave_review('Great', 5)

		expect(page).to have_content 'Average rating: ★★★★☆'
	end

end