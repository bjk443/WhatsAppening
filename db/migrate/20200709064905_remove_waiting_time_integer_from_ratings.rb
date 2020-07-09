class RemoveWaitingTimeIntegerFromRatings < ActiveRecord::Migration[6.0]
  def change
    remove_column :ratings, :waiting_time, :integer
  end
end
