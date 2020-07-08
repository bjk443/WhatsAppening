class AddVenuesIdToEvents < ActiveRecord::Migration[6.0]
  def change
    add_reference :events, :venue, null: false, foreign_key: true
  end
end
