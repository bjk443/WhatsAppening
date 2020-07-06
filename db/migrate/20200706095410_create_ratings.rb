class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.integer :stars
      t.string :comment
      t.integer :crowd_level
      t.string :photo
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
