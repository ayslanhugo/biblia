class CreateChallengeDays < ActiveRecord::Migration[8.0]
  def change
    create_table :challenge_days do |t|
      t.references :challenge, null: false, foreign_key: true
      t.integer :day_number
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
