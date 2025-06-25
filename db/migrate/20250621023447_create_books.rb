class CreateBooks < ActiveRecord::Migration[8.0]
  def change
    create_table :books do |t|
      t.references :version, null: false, foreign_key: true
      t.string :name
      t.string :abbrev

      t.timestamps
    end
  end
end
