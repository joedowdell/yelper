class Endorsement < ActiveRecord::Base
  belongs_to :review
  belongs_to :restaurant
end