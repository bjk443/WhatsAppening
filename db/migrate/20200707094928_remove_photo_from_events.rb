class RemovePhotoFromEvents < ActiveRecord::Migration[6.0]
  def change
    remove_column :events, :photo
  end
end
