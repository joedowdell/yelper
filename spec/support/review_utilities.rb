def leave_review(thoughts, rating)
	visit restaurants_path
	click_link 'Review Nandos'
	fill_in 'Thoughts', with: 'thoughts'
	select rating.to_s, from: 'Rating'
	click_button 'Leave review'
end