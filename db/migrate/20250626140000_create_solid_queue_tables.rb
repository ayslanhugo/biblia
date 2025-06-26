class CreateSolidQueueTables < ActiveRecord::Migration[8.0]
  def change
    create_table :solid_queue_jobs do |t|
      t.string :queue_name, null: false, index: true
      t.string :class_name, null: false, index: true
      t.text :arguments
      t.integer :priority, default: 0, null: false
      t.string :active_job_id, index: true
      t.datetime :scheduled_at, index: true
      t.datetime :finished_at, index: true
      t.string :concurrency_key

      t.timestamps
    end

    create_table :solid_queue_scheduled_executions do |t|
      t.references :job, index: { unique: true }, null: false
      t.datetime :scheduled_at, null: false
      t.integer :priority, default: 0, null: false

      t.datetime :created_at, null: false

      t.index [ :scheduled_at, :priority ], name: "index_solid_queue_scheduled_executions_on_scheduled_at_and_priority"
    end

    create_table :solid_queue_ready_executions do |t|
      t.references :job, index: { unique: true }, null: false
      t.string :queue_name, null: false, index: true
      t.integer :priority, default: 0, null: false

      t.datetime :created_at, null: false

      t.index [ :priority, :job_id ], name: "index_solid_queue_ready_executions_on_priority_and_job_id"
    end

    create_table :solid_queue_claimed_executions do |t|
      t.references :job, index: { unique: true }, null: false
      t.string :claimed_by
      t.datetime :created_at, null: false
    end

    create_table :solid_queue_blocked_executions do |t|
      t.references :job, index: { unique: true }, null: false
      t.string :concurrency_key, null: false, index: {
        length: { concurrency_key: 191 },
        name: "index_solid_queue_blocked_executions_for_maintenance"
      }

      t.datetime :created_at, null: false
    end

    create_table :solid_queue_pauses do |t|
      t.string :queue_name, null: false, index: { unique: true }
      t.datetime :created_at, null: false
    end
  end
end