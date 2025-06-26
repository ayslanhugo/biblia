
class CreateSolidCacheEntries < ActiveRecord::Migration[8.0]
  def change
    create_table :solid_cache_entries do |t|
      t.binary :key, null: false, index: { unique: true }
      t.binary :value, null: false
      t.datetime :created_at, null: false
    end
  end
end