require 'rails_helper'

RSpec.describe Restaurant, :type => :model do


	let(:restaurant) { Restaurant.create(name: 'Nandos') }

	describe '#average_rating' do

		context 'no reviews' do
			it 'returns N/A' do
				expect(restaurant.average_rating).to eq 'N/A'
			end
		end

		context '1 review' do
			it 'returns that rating' do
				restaurant.reviews.create(rating: 4)
				expect(restaurant.average_rating).to eq 4
			end
		end

		context 'multiple reviews' do

			it 'returns the average of all ratings' do
				restaurant.reviews.create(rating: 3)
				restaurant.reviews.create(rating: 5)

				expect(restaurant.average_rating).to eq 4
			end

			it 'returns a float number, if average is a non-whole number' do
				restaurant.reviews.create(rating: 4)
				restaurant.reviews.create(rating: 5)

				expect(restaurant.average_rating).to eq 4.5
			end

		end


	end

	describe 'validations' do 
	
		it 'is valid with a unique name of > 2 characters, starting with a uppercase letter' do
			restaurant = Restaurant.new(name: 'Chipotle')
			expect(restaurant).to have(:no).errors_on(:name)
		end

		it 'is not valid with a name of < 2 characters' do
			restaurant = Restaurant.new(name: 'Ab')
			expect(restaurant).to have(1).errors_on(:name)
		end

		it 'is not valid if it does not start with an uppercase letter' do
			restaurant = Restaurant.new(name: 'chipotle')
			expect(restaurant).to have(1).errors_on(:name)
		end

		it 'is not valid if it is not unique' do
			Restaurant.create(name: 'Chipotle')
			restaurant = Restaurant.new(name: 'Chipotle')
			expect(restaurant).to have(1).errors_on(:name)
		end

	end

end