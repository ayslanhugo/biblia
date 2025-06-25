class CreateFavoriteVerses < ActiveRecord::Migration[8.0]
  def change
    create_table :favorite_verses do |t|
      t.references :user, null: false, foreign_key: true
      t.references :verse, null: false, foreign_key: true

      t.timestamps
    end
  end
end
