class UserReferenceAddedToRating < ActiveRecord::Migration[6.0]
  def change
    add_reference :ratings, :user, index: true
  end
end
