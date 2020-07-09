class AddWaitingTimeStringToRatings < ActiveRecord::Migration[6.0]
  def change
    add_column :ratings, :waiting_time, :string
  end
end
