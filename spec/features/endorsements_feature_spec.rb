require 'rails_helper'

describe 'endorsements reviews' do
	 before do
	    nandos = Restaurant.create(name: 'Nandos')
	    nandos.reviews.create(rating: 3, thoughts: 'OK')
  	end

  it "can endorse reviews, updating the review's endorsement count", js: true do
    visit '/restaurants'
    click_link 'Endorsement this review'
    expect(page).to have_content '1 endorsement'
  end
end