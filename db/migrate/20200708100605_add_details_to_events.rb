class AddDetailsToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :artist, :string
    add_column :events, :genre, :string
  end
end
