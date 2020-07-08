class AddcolumnToVenues < ActiveRecord::Migration[6.0]
  def change
    add_column :venues, :category, :string
  end
end
