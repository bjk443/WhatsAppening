class RemoveVenuesIdFromEvents < ActiveRecord::Migration[6.0]
  def change
    remove_column :events, :venues_id
  end
end
