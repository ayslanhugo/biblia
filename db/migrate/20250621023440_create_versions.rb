class CreateVersions < ActiveRecord::Migration[8.0]
  def change
    create_table :versions do |t|
      t.string :name
      t.string :abbrev

      t.timestamps
    end
  end
end
