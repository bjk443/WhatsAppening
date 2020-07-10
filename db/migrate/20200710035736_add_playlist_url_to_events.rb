class AddPlaylistUrlToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :playlist_id, :string
  end
end
