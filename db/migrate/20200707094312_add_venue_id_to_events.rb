class AddVenueIdToEvents < ActiveRecord::Migration[6.0]
  def change
    add_reference :events, :venues, null: false, foreign_key: true
  end
end
