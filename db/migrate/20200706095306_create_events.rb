class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :category
      t.time :start_time
      t.time :end_time
      t.integer :waiting_time
      t.integer :crowding
      t.integer :rating
      t.string :photo

      t.timestamps
    end
  end
end
