class CreateUserChallengeDays < ActiveRecord::Migration[8.0]
  def change
    create_table :user_challenge_days do |t|
      t.references :user_challenge, null: false, foreign_key: true
      t.references :challenge_day, null: false, foreign_key: true
      t.boolean :completed

      t.timestamps
    end
  end
end
