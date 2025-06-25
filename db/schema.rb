# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_06_25_042045) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "books", force: :cascade do |t|
    t.bigint "version_id", null: false
    t.string "name"
    t.string "abbrev"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["version_id"], name: "index_books_on_version_id"
  end

  create_table "challenge_days", force: :cascade do |t|
    t.bigint "challenge_id", null: false
    t.integer "day_number"
    t.string "title"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["challenge_id"], name: "index_challenge_days_on_challenge_id"
  end

  create_table "challenges", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chapters", force: :cascade do |t|
    t.bigint "book_id", null: false
    t.integer "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_chapters_on_book_id"
  end

  create_table "favorite_verses", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "verse_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_favorite_verses_on_user_id"
    t.index ["verse_id"], name: "index_favorite_verses_on_verse_id"
  end

  create_table "highlights", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "verse_id", null: false
    t.integer "start_offset"
    t.integer "end_offset"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_highlights_on_user_id"
    t.index ["verse_id"], name: "index_highlights_on_verse_id"
  end

  create_table "notes", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id", null: false
    t.bigint "verse_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_notes_on_user_id"
    t.index ["verse_id"], name: "index_notes_on_verse_id"
  end

  create_table "user_challenge_days", force: :cascade do |t|
    t.bigint "user_challenge_id", null: false
    t.bigint "challenge_day_id", null: false
    t.boolean "completed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["challenge_day_id"], name: "index_user_challenge_days_on_challenge_day_id"
    t.index ["user_challenge_id"], name: "index_user_challenge_days_on_user_challenge_id"
  end

  create_table "user_challenges", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "challenge_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["challenge_id"], name: "index_user_challenges_on_challenge_id"
    t.index ["user_id"], name: "index_user_challenges_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "verses", force: :cascade do |t|
    t.bigint "chapter_id", null: false
    t.integer "number"
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chapter_id"], name: "index_verses_on_chapter_id"
  end

  create_table "versions", force: :cascade do |t|
    t.string "name"
    t.string "abbrev"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "books", "versions"
  add_foreign_key "challenge_days", "challenges"
  add_foreign_key "chapters", "books"
  add_foreign_key "favorite_verses", "users"
  add_foreign_key "favorite_verses", "verses"
  add_foreign_key "highlights", "users"
  add_foreign_key "highlights", "verses"
  add_foreign_key "notes", "users"
  add_foreign_key "notes", "verses"
  add_foreign_key "user_challenge_days", "challenge_days"
  add_foreign_key "user_challenge_days", "user_challenges"
  add_foreign_key "user_challenges", "challenges"
  add_foreign_key "user_challenges", "users"
  add_foreign_key "verses", "chapters"
end
