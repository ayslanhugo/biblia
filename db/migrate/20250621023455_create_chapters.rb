class CreateChapters < ActiveRecord::Migration[8.0]
  def change
    create_table :chapters do |t|
      t.references :book, null: false, foreign_key: true
      t.integer :number

      t.timestamps
    end
  end
end
