class Restaurant < ActiveRecord::Base
	has_many :reviews, dependent: :destroy
	validates :name, length: { minimum: 3 }, format: { with: /\A[A-Z]/, message: 'has to begin with a capital letter' }, uniqueness: true
end