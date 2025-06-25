class CreateVerses < ActiveRecord::Migration[8.0]
  def change
    create_table :verses do |t|
      t.references :chapter, null: false, foreign_key: true
      t.integer :number
      t.text :text

      t.timestamps
    end
  end
end
