class CreatePlanDays < ActiveRecord::Migration[8.0]
  def change
    create_table :plan_days do |t|
      t.references :reading_plan, null: false, foreign_key: true
      t.integer :day_number
      t.text :passages

      t.timestamps
    end
  end
end
