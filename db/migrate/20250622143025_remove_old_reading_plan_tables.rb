# db/migrate/..._remove_old_reading_plan_tables.rb
class RemoveOldReadingPlanTables < ActiveRecord::Migration[8.0]
  def change
    # Apaga a tabela 'plan_days' primeiro por causa da dependência (foreign key)
    drop_table :plan_days
    # Apaga a tabela 'reading_plans'
    drop_table :reading_plans
  end
end
