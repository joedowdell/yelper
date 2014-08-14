class AddReviewIdToEndorsements < ActiveRecord::Migration
  def change
    add_reference :endorsements, :review, index: true
  end
end
