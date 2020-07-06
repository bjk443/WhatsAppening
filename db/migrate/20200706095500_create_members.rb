class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.integer :points
      t.string :badge
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
