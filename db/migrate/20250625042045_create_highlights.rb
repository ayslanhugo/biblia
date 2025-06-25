class CreateHighlights < ActiveRecord::Migration[8.0]
  def change
    create_table :highlights do |t|
      t.references :user, null: false, foreign_key: true
      t.references :verse, null: false, foreign_key: true
      t.integer :start_offset
      t.integer :end_offset
      t.string :color

      t.timestamps
    end
  end
end
