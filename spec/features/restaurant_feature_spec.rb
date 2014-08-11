require 'rails_helper'

describe 'restaurants' do

  context 'no restaurants have been added' do
		it 'should display a prompt to add a restaurant' do
      visit '/restaurants'
      expect(page).to have_content 'No restaurants yet'
      expect(page).to have_link 'Add a restaurant'
    end
  end

	context 'restaurants have been added' do
		
		before(:each) do
			Restaurant.create(name: 'Nandos') 
		end

		it 'should display them' do
			visit '/restaurants'
			expect(page).to have_content 'Nandos'
		end

	end
  
end